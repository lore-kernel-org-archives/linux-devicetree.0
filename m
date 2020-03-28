Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E651AC43331
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 21:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7FD520732
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 21:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="T7v69ufE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgC1Vx7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 17:53:59 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:36043 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgC1Vx7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 17:53:59 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 4713A2222E;
        Sat, 28 Mar 2020 22:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1585432436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=4Vluh/A7C6A27nkzDnaNlqocm//1tSG7oVts7dOyKkA=;
        b=T7v69ufEmlhO4G/bpitd05VmKlay7t81udTXyrZcKJlUxRBkG03BwRXvxTOQp7VA3hCpkV
        r01PGYc/Z/sB+N7uwlzP1jc07T6/CSbae5aHNoAynUDT4L5kahn5NVDaJ+38/3yQkot2gN
        k5zW4yamKLSJXz2tllAc5HqIZRCM42w=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 28 Mar 2020 22:53:56 +0100
From:   Michael Walle <michael@walle.cc>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: MFD and device tree modeling
Message-ID: <e55d59a68f497c8f2eb406d40ae878b9@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 4713A2222E
X-Spamd-Result: default: False [-0.10 / 15.00];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.2:email,0.0.0.0:email];
         NEURAL_HAM(-0.00)[-0.753];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, Hi Lee,

The MFD subsystem can match a mfd_cell to a device tree node. The
current matching just looks at the compatible string. But this
falls short when there are multiple sub devices with the same
compatible string.

In my first try (see [1]), I tried to match the reg property to
the cell id. But this will result in a warning if there are two
subdevices with the same cell id but different compatible string.
For example:

mfd-device {
   gpio@0 {
     compatible = "vendor,gpio";
     reg = <0>;
   };

   gpio@1 {
     compatible = "vendor,gpio";
     reg = <1>;
   };

   pwm@0 {
     compatible = "vendor,pwm";
     reg = <0>;
   };
};

So, my next idea was to have a "linux,mfd-cell-id" property, but
this will have the same warning because apparently it is not
allowed to have a unit-address in the node name without a reg
property, correct?
Example:

mfd-device {
   gpio@0 {
     compatible = "vendor,gpio";
     linux,mfd-cell-id = <0>;
   };

   gpio@1 {
     compatible = "vendor,gpio";
     linux,mfd-cell-id = <1>;
   };

   pwm@0 {
     compatible = "vendor,pwm";
     linux,mfd-cell-id = <0>;
   };
};

So the third idea was to not have the node names with an
unit-address but just named gpio0, gpio1, etc. But this falls
short for the $nodename restriction in pwm.yaml, which has to
be pwm@N. So I guess the only one is to use artificial
unit-addresses and linux,mfd-cell-id.
Example:

mfd-device {
   gpio@0 {
     compatible = "vendor,gpio";
     reg = <0>;
     linux,mfd-cell-id = <0>;
   };

   gpio@1 {
     compatible = "vendor,gpio";
     reg = <1>;
     linux,mfd-cell-id = <1>;
   };

   pwm@2 {
     compatible = "vendor,pwm";
     reg = <2>;
     linux,mfd-cell-id = <0>;
   };
};

What do you think?

Please note that I cannot use some kind of register offset for
the unit-address, because that will be given by the mfd core
driver. That is because the register layout might be updated
in the future and I want to keep the register offsets just
in the mfd core driver.

-michael


[1] 
https://lore.kernel.org/linux-devicetree/20200317205017.28280-4-michael@walle.cc/
