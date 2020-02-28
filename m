Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93ADC3F2D2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 11:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D3312084E
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 11:52:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="f0ARzT0M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgB1Lwu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 06:52:50 -0500
Received: from mout.gmx.net ([212.227.17.22]:47203 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgB1Lwt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Feb 2020 06:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582890761;
        bh=E4E1cvmOoa1R3ggxn0W5VA37j87qo9Un/InroAhqkxA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=f0ARzT0M69Tkv4sX7EVjqXDq+weVvqBWEzI6nuip1xvjpEM/N7mLFtv0des64thHM
         m8pDMwxZyqcxyVBVqCiMjhfbR1QYB3Mg64DSDf7YPo8JS37HMH+WTOachGghuseIRY
         KwBIPB+5aAZo5dpPwoDLSdovQ7WukH9JcdtX+waI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.68] ([86.161.30.248]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MwQXN-1jQPV62lTJ-00sKBB; Fri, 28
 Feb 2020 12:52:41 +0100
Subject: Re: [PATCH] define rpi0w sdhci pinctrl state
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <c34db439-3539-88c0-99f1-308d75afd1aa@gmx.co.uk>
 <23a936db-fc89-6259-3991-5791fa88beb7@i2se.com>
From:   Nick Hudson <nick.hudson@gmx.co.uk>
Message-ID: <bd4bd5dc-307f-d058-8f94-00b61a8b8c87@gmx.co.uk>
Date:   Fri, 28 Feb 2020 11:52:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <23a936db-fc89-6259-3991-5791fa88beb7@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IyQXi+K25Am9OBXickJYB4m0olsIqE0l79J0l2rgQvn5sxjnn2T
 zBswdHhNXLMx8vSzl6LkLTbD2kZFCXq2nY1FbPb9DYaG3TyKsiwgWFtRu4ybyYMwTvwwQOR
 IYqVdu9kPMbUisp7N0FIDDt9KpMRrc1KdTpY4ftdVwVdFQh4FxlWwlodM4yZW1BrqOciEa4
 HRNTDJXjOnZB7kWMCu+nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K97iQwfrBgI=:GRJ64+SJQCITrVbeU4yKzI
 S2xEAJCgNSAjk0L3nQFviEpklg81aI6H7030NuJpRfEpECVlf3JauOGxc9Pu0W7vfiIK2diWD
 A5yoBNuXhXDWDa8RDHOvfroQKqHvcr4lRQ9Oav2mBy2fie7WIFTyttQZFvSuxkW5Z9kIQwlON
 3H4BknzG0D6H/Ps1pXftnqBtVck6LsvDqotSRFsaYUE97ALO8V91V13WUF4msb3xdp8m2xPYq
 TYGgBgbRcKrJp8K1DWNmda2/CJZrLJZ2OLoKPFbEOIdgBGyxXLgFavYN7cYGMlbfT0dIXZQCz
 YwPWJCUSZPXeGp/pbvJonFznLW5TqLodn2s92KEtLNIUlgrhk4FC6C0AffHqdl1Iyv1nzmN0j
 e+bUCQX3CubkdZsnu3rOh/5KfDIK05BsXzz72wuwewwoD4VcGYRf0Hwul/QMQy9UEerHfJoq1
 hEs8X/u0wLuziCWnPQ8YAi0LWYql8NmhJTuDqt3svwETlesfG3K57mIAmcLYaF+TvNPFIqbWR
 eW4XFI93AfL9XYcBt8mP2WGLMYKnhiS7e1yTHHNSWumq6JyACw8C7q2tpoR6+BlZOv1bR7zq9
 rBUyZfVlBfNbv04az5l/Om+vgBVuS6Kq00fUgbhllzR0MbtDcEuG5fj5ip/FtdRD448Z74uUc
 inJtLumA6nwcYb7Xs3J3i3P7Ef8ecCfW7Y1nu08ranIRVRvUblSj9ijEDiqvDH8AVJPF9J8vl
 YH3C7onvBfZmwqxpXTeuLXYioQTb8VLuXBeNCm7p+mnOGD6AC9L6xqhOtvjH7vruhjdKu806l
 S90ui83kiqzyA0jthgtJjrgwOBshkJfrWGsjBqrzVVGDP0Vucm7WzDJYWmaoX5xFiEXpXrpzN
 Bl5H5V4KFaEDKPeNpqdt6noQDWIoXnAvmyhFKDTaESjHUP7rOUHOnITXe/VPj7pK7b3H9wQGk
 V2Vu0V6ctRiOAN2RrEMYQkPg+px9Zn8HfAvLJn3P+ifRfunmMjukShOAZ2M57XEHW1hpMzooV
 SibiobbhaMMlZ/RaOgmu2Nmo07tZhm4NMnRI99aWvp8651uJi9JqIBSUjb2mByvHexbmDysN1
 WOGzJy5QLEHgVL+KQ8rBqs8+ULh2AZLa+Q6KbbJBKFoUylMFtwNIA3BNMS2I5eeZt0AmMS26Y
 RglB67ON9wWnAdYRQhK4NBvLhN2TBJu+ZOT9MLmQtHnkl58e+f1hRV6hMVnkR4DyoLHQKnVXm
 RE8QN5wjRUTnlIkTV
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 27/02/2020 17:53, Stefan Wahren wrote:
> Hi Nick,
>
> Am 27.02.20 um 00:33 schrieb Nick Hudson:
>> I'm still not sure where I should be sending this, but here goes.
>
> the addresses are right. Please rebase your change against recent Linux
> git tree and generate a git patch, otherwise we cannot apply your it.
Oops, I see I sent the comletely the wrong diff... will fix.

>
> I suggest the following subject:
>
> ARM: bcm2835-rpi-zero-w: Add missing pinctrl name

will do.

>
> Thanks
> Stefan

Thanks,
Nick
