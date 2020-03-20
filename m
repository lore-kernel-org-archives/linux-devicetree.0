Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289BDC4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 22:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5D0020722
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584743703;
	bh=3pMwYGuvn7XhcJgp/i6E3lfVCCge6BuAIw+OQtQNinw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qmY1I01ObadMY/U7grIyS7A4lILeaYTRBDPFlJZWPA1WNNOXzx8USfGS1OkKcowH4
	 GuX0D6IdQskyW2OfjdeRSX0fWb+rw7IWQQwrLAXDjHtFnBH5zful8l3fGMp91OOtbL
	 2XV+AO8vnAsPdKs8bPDdhFMnEnqUvra3FkNsnCEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgCTWfC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 18:35:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32783 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgCTWfC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 18:35:02 -0400
Received: by mail-io1-f65.google.com with SMTP id o127so7719614iof.0;
        Fri, 20 Mar 2020 15:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iYciGqaZt2GL/kj0/kVz5mt7vxAxWiWPCnXAqKnI3no=;
        b=fuUVRKA5JgJVdgPXFvHPRM8B1go/Vs3PwswVYbDv4fQCgkRci2DbptNcbDRMbnVztV
         pYNbdCIEcnNZ0nR60yj/NwKTbCLbVE2LtB8DdWX3D2tO6xPGgl6pEAhwoFqt/Vd6dKKn
         xxHcyeOtha1DN+FcXpG1vouohDSFo1EKESlhCqqwEgNe7iLP3yCX0kM1vxA0tcAWd63h
         e8gl7I61Goo1L3IzZNLkv3j81eDNHf2KP9ca3AvV0t8EHYJ8NEuKniAxS5BsQzKCsA/x
         J89kk9X5maVpQ0LyLfa6pT7pNwS0KAL4l1vfMS7ocjrnduh6Si9SaTkQl+GUi7DSV+fN
         +Dvg==
X-Gm-Message-State: ANhLgQ3vsqYi3DFCh8OAJd3Zu2vOB098E/SV0DdDs9t4+NS2KeMKne7d
        oHKDdNtSUzIf3W5xZ42Txg==
X-Google-Smtp-Source: ADFU+vtfbO55Y84haPlaouVd2A0t5+O/OMxe2jOE3ZF5rxCay9OVhEtzVFY1uwiNSp5ffMR9k4zBhA==
X-Received: by 2002:a5d:814a:: with SMTP id f10mr9397108ioo.7.1584743701048;
        Fri, 20 Mar 2020 15:35:01 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f80sm2469907ild.25.2020.03.20.15.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:35:00 -0700 (PDT)
Received: (nullmailer pid 21112 invoked by uid 1000);
        Fri, 20 Mar 2020 22:34:58 -0000
Date:   Fri, 20 Mar 2020 16:34:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: Add cros-ec Type C port driver
Message-ID: <20200320223458.GA15213@bogus>
References: <20200316090021.52148-1-pmalani@chromium.org>
 <20200316090021.52148-2-pmalani@chromium.org>
 <CAFqH_50eGjYu7dHFW82CY4-EyDtq+AF+6tHCAjKbaAjW5_7WYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqH_50eGjYu7dHFW82CY4-EyDtq+AF+6tHCAjKbaAjW5_7WYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 16, 2020 at 04:14:13PM +0100, Enric Balletbo Serra wrote:
> Hi Prashant,
> 
> Missatge de Prashant Malani <pmalani@chromium.org> del dia dl., 16 de
> març 2020 a les 10:02:
> >
> > Some Chrome OS devices with Embedded Controllers (EC) can read and
> > modify Type C port state.
> >
> > Add an entry in the DT Bindings documentation that lists out the logical
> > device and describes the relevant port information, to be used by the
> > corresponding driver.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> After Rob review, it can go together with the other patches through
> the chrome-platform tree. From my side:

LGTM, but it is dependent on usb-connector.yaml which I picked up. 
Either I can take this patch or you pull my dt/next branch in.

Rob
