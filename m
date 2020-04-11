Return-Path: <SRS0=gZHh=53=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3ACC2BA1A
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 03:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D08620936
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 03:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDKDps (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 23:45:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:42544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbgDKDps (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 Apr 2020 23:45:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 28F5DACA2;
        Sat, 11 Apr 2020 03:45:46 +0000 (UTC)
From:   NeilBrown <neil@brown.name>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        gregkh@linuxfoundation.org
Date:   Sat, 11 Apr 2020 13:45:39 +1000
Cc:     driverdev-devel@linuxdriverproject.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH 0/2] staging: mt7621-pci-phy: dt: bindings: convert bindings file from txt to yaml
In-Reply-To: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
References: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
Message-ID: <875ze6vg64.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain


Hi Sergio,
 thanks for your continuing work on mt7621-pci.
 I've looked through you patches and while things seem to make sense I
 don't have the expertise to review them properly.

 I've just a build a kernel based on v5.6.3 with the patches listed
 below applied from your various emails over the last couple of months.

 I have confirm that PCI works and in particular I don't get the
 cold-boot hangs that are common without these patches.  So that is an
 excellent result.

Thanks,
NeilBrown

7e4350e416ed staging: mt7621-pci: simplify 'mt7621_pcie_init_virtual_bridges' function
283e56fe3f49 staging: mt7621-pci: enable clock bit for each port
5edfd9ca31ad MIPS: ralink: mt7621: introduce 'soc_device' initialization
7ce68fa530ad staging: mt7621-pci: use gpios for properly reset
ccffb8f9a204 staging: mt7621-pci: change value for 'PERST_DELAY_MS'
840b0de42c22 staging: mt7621-dts: make use of 'reset-gpios' property for pci
bd44f2c46e60 staging: mt7621-pci: bindings: update doc accordly to last changes
a83cb7040463 staging: mt7621-pci: release gpios after pci initialization
51ae5f557464 staging: mt7621-pci: delete no more needed 'mt7621_reset_port'
6d5af2af8fdd staging: mt7621-pci-phy: add 'mt7621_phy_rmw' to simplify code
8f4e9d5f57ca staging: mt7621-pci: fix io space and properly set resource limits
d907c205371d staging: mt7621-pci: fix register to set up virtual bridges
1a87910faf27 staging: mt7621-pci: don't return if get gpio fails
dcd05b5bda59 staging: mt7621-pci-phy: avoid to create to different phys for a dual port one
b2c3746212ae staging: mt7621-dts: set up only two pcie phys
ef178ecf08bd staging: mt7621-pci: use only two phys from device tree
2553c237ffdc staging: mt7621-pci: change variable to print for slot
0bcb3caed96e staging: mt7621-pci: be sure gpio descriptor is null on fails
07d3877ebc7e staging: mt7621-pci: avoid to poweroff the phy for slot one
ba5687b6220b staging: mt7621-dts: gpio 8 and 9 are vendor specific
04c8eb6ff776 staging: mt7621-pci: delete release gpios related code
d3b3de21837b staging: mt7621-pci: use builtin_platform_driver()
41cd2464a89e staging: mt7621-pci: add myself as a contributor of the driver
815535a5b6ad staging: mt7621-pci-phy: use builtin_platform_driver()
8c26a5eec020 staging: mt7621-pci-phy: re-do 'xtal_mode' detection
ccaa47aeb530 staging: mt7621-pci: avoid to set 'iomem_resource' addresses
28dd5daf3b55 staging: mt7621-pci: properly power off dual-ported pcie phy
10e6aa437d6e staging: mt7621-pci-phy: dt: bindings: add mediatek,mt7621-pci-phy.yaml
8dc6eec861d2 staging: mt7621-pci-phy: dt: bindings: remove bindings txt file

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl6RPWQACgkQOeye3VZi
gbkkXxAAkROtK0GHAp/5Yy51FgaXbX8pfAL1eGjL+gmzW9W07D6oNLyy3DcCzL6g
eQqHTtbVWRphQdzsr7tMSKl5HmRNEhW4EYSfKO5q2U8EroTsrFPMlB0cRasS37gl
tidKyDoM/c5auvPJpoyIG4MVmHSoJNi+XaIfxZjENyZ5gC0K8NiCkjq7i90cBNsL
Io6pedeutNpVZ/bBoUe/5t6Mir8g9uXb2o2Mju3Ce0jJeIG6j3P93vcLNkWNdL/V
PfqJRk3f+xtYAzZNP6wURFnLCaImNkcX06HPCFNw8rHOdK/LQlTYJaAQdMfHXYeZ
JocMFNp/sc2D0vCtib7foPv0nkRkLfZInb8VlE+SBi1Ibj8GMesWMO37oolGAbH6
DzTwiM+GMOdJl147J5kQ4pQuYqBfDSyjOZoIIN+Hcwuqs29C2LXF0c7BJweTfbDG
CI30I/65fc8L2U45Ll4IiOtHxzY60rvXpa2p16zoOjwMIq/cV+xUap42TKevpacJ
UwVU48tzW3ayqf85bHcwrnB9ntrHLOQWWbLiV0H3D7hcvdHeNTxOddJXXzu0IQTR
nhx8em9PvNIUUNXYj408Yuq7P17yuiaCxovLau7rYQtbVzxolOHqikYv5Mf1q1cb
Zpd/R4IHY84wix7EmJUbNjpMxU1eME2N/P/TCvMzg+Kaq25jF34=
=TA6c
-----END PGP SIGNATURE-----
--=-=-=--
