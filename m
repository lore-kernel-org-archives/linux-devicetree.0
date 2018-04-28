From: Vivek Unune <npcomplete13@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Fix NAND ECC parameters for Linksys Panamera
Date: Sat, 28 Apr 2018 00:19:36 -0400
Message-ID: <CAChtp74P5iXZjtooR5e1PgmNYU7qD07GSyKo9GV-3ObR1zGvHw@mail.gmail.com>
References: <20180310171244.70299-1-npcomplete13@gmail.com>
 <CACna6rz1TeRbPq-60HkHz9A0TDn+iXtmXniE6FCiANpUmV-qrw@mail.gmail.com>
 <20180311100313.znonhesgh462rz65@osboxes> <2ef6e4fc-cce7-372e-e35f-578fd6ada9ca@gmail.com>
 <20180313010210.ws4dugy3rrpqwzmk@osboxes> <00df9ee9-2bd2-ad2b-fdf8-682efdb9a4d1@gmail.com>
 <20180427140542.c3t5taztkciimfny@osboxes>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427140542.c3t5taztkciimfny@osboxes>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2018 at 10:05 AM, Vivek Unune <npcomplete13@gmail.com> wrot=
e:
> On Wed, Apr 25, 2018 at 11:02:04AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> The easiest solution: ignore all these "error -74 (ECC error) while
>> reading" errors (they may last for few minutes!). I believe UBI should
>> simply recreate all pages it couldn't access and once you wait long
>> enough, all your NAND flash will be using BCH8.
>
> Let me build the firmware with BCH-8 and wait it out. I'll report back my
> results.

I can confirm that BCH-8 indeed works after letting it run through those
ECC errors.

Thanks!

Vivek
