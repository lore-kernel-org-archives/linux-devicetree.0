Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746A0C433E6
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45E2022201
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NO4iCP+9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgGNLgZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 07:36:25 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42418 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgGNLgY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 07:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594726583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4KHHcRC2VLgrkJIS1heGnq6O4q6D/sHPLprylxHZT2M=;
        b=NO4iCP+9RwRB+Tp9Hvr9CHZPXlYfMKLdLBqZErmaXSKFAMr/olnmf3N8Ea3abgqCFoQ1iF
        jW8M98Fe2wJKuQCWsdZQrGmfJ369EDzZH2hkODz/dNwGTqxt9twRhvO6Lwk8AOYgSqTNus
        q3xMQUa2SThZU5EC2PVFylzy9Q1nFE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-fQEPAtMEN-qURFflfOpU6w-1; Tue, 14 Jul 2020 07:36:21 -0400
X-MC-Unique: fQEPAtMEN-qURFflfOpU6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DDFD107ACCA;
        Tue, 14 Jul 2020 11:36:20 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9BF18797E3;
        Tue, 14 Jul 2020 11:36:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: PATCH 0/4] usbd: typec: fusb302: Add support for specifying supported alternate-modes through devicetree/fwnodes
Date:   Tue, 14 Jul 2020 13:36:13 +0200
Message-Id: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi All,

This is a replacement series for an earlier attempt by me for this
from quite a while ago:

https://patchwork.kernel.org/patch/11199517/

As discussed there, this series implements an altmodes devicetree-fwnode
under the usb-connector node which has 1 child-node per supported
altmode and in that child-node the svid and vdo for the supported
altmode are specified.

Note this patch-set does not contain any devicetree users of the
new bindings. The new support/binding is used on X86 Cherry Trail
devices with a fusb302 Type-C controller (special variant of the
INT33FE device in ACPI). But this patch should also help getting
Display Port altmode to work with the mainline kernel on boards
like the Pine RockPro64 and Pinebook Pro, which is why I've added
Tobias Schramm to the Cc since he has done mainline devicetree
work for the Pinebook Pro in the past.

The 1st patch adds the dt-bindings docs. I'm not sure if this one
should go upstream through the USB tree together with patches 2-3 or
if this should go upstream separately, Rob ?

Patches 2-3 add support for the new binding to Type-C controller drivers
using the tcpm framework, such as the fusb302 driver.

Patch 4 uses swnodes to add the altmode info on the earlier mentioned
X86 CHT devices, making DP-altmode work there for the first time.

Regards,

Hans

