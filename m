Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15008C47255
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 21:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBDED21655
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 21:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=securessvsmail.xyz header.i=@securessvsmail.xyz header.b="paHqxgQj";
	dkim=pass (1024-bit key) header.d=securessvsmail.xyz header.i=@securessvsmail.xyz header.b="paHqxgQj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgEHV5n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 17:57:43 -0400
Received: from freas.net ([62.173.152.33]:37802 "EHLO host.securessvsmail.xyz"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727774AbgEHV5n (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 May 2020 17:57:43 -0400
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 May 2020 17:57:42 EDT
Received: from securessvsmail.xyz (2rt7.w.time4vps.cloud [89.40.10.200])
        by host.securessvsmail.xyz (Postfix) with ESMTPA id 37886301229CB
        for <devicetree@vger.kernel.org>; Sat,  9 May 2020 00:47:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 host.securessvsmail.xyz 37886301229CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=securessvsmail.xyz;
        s=default; t=1588974458;
        bh=TOUrQtNA/9Lcm9zkDMeg72zVB746Q4FAPUpPflwTIWQ=;
        h=Reply-To:From:To:Subject:Date:From;
        b=paHqxgQjXZiCXq/A4MXTcb0uL2k2C/Yz2UWLg8/nGLUccU2oZdPB9ZjpxQDrkZkH6
         AyVaL9a0/eStbq3+yv0oHXwpviYnEQMCX71UMi0wa2Zd0vSouCQNrDmBH9emWclM6o
         fPiAtBz3b8BRyshBkIrqORFa/rOILnj7Y8DsTEZw=
DKIM-Filter: OpenDKIM Filter v2.11.0 host.securessvsmail.xyz 37886301229CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=securessvsmail.xyz;
        s=default; t=1588974458;
        bh=TOUrQtNA/9Lcm9zkDMeg72zVB746Q4FAPUpPflwTIWQ=;
        h=Reply-To:From:To:Subject:Date:From;
        b=paHqxgQjXZiCXq/A4MXTcb0uL2k2C/Yz2UWLg8/nGLUccU2oZdPB9ZjpxQDrkZkH6
         AyVaL9a0/eStbq3+yv0oHXwpviYnEQMCX71UMi0wa2Zd0vSouCQNrDmBH9emWclM6o
         fPiAtBz3b8BRyshBkIrqORFa/rOILnj7Y8DsTEZw=
Reply-To: labdellatif@securesvsmail.com
From:   Laghouili <labdellatif@securessvsmail.xyz>
To:     devicetree@vger.kernel.org
Subject: Collaboration
Date:   08 May 2020 22:47:38 +0100
Message-ID: <20200508224738.8287794E93112D67@securessvsmail.xyz>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello there,

I am Laghouili Abdellatif. I am contacting you because I have a=20
proposal that I think may be interested in. I represent the=20
interest of my brother in-law who was a minister in the Syrian=20
Government. As you probably know, there is a lot of crisis going=20
on currently in Syria and my brother in-law has fallen out with=20
the ruling Junta and the president because of his foreign=20
policies and the senseless war and killings that has been going=20
on for a while. Everybody in Syria is fed up and want a change=20
but the president is too powerfull and he simply kills anyone=20
that tries to oppose him. My brother in-law belives that he is at=20
risk and he is now very scared for the safety of his family=20
especially his kids. In order to ensure that his family is taken=20
care of and protected incase anything happens to him, he has=20
asked me to help him find a foreign investor who can help him=20
accommodate and invest 100 MUSD privately that he has secured in=20
Europe. He wants these funds safely invested so that the future=20
and safety of his family can be secured.

I am contacting you with the hope that you will be interested in=20
helping us. We need your help to accommodate the funds in the=20
banking system in your country and also invest it in a lucrative=20
projects that will yeild good profits. We will handle all the=20
logistics involved in the movement of the funds to you. The funds=20
is already in Europe so you have nothing to worry about because=20
this transaction will be executed in a legal way. My brother in-
law has also promised to compensate you for your help. He wants=20
this to be done discretely so I will be acting as his eyes and=20
ears during the course of this transaction.

If this proposal interests you, please kindly respond so that I=20
can give you more details.

Regards,

Laghouili.
