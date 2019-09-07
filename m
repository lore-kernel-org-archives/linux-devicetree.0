From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/6] ARM: dts: mmp2: devicetree updates
Date: Sat, 7 Sep 2019 21:57:42 +0200
Message-ID: <CAK8P3a0nNEoy31oxFL11Y2VHw-O=m8e8JuuQk+FjiPh94GikoA@mail.gmail.com>
References: <20190828072629.285760-1-lkundrak@v3.sk> <20190907194040.GB25459@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190907194040.GB25459@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 7, 2019 at 9:40 PM Pavel Machek <pavel@ucw.cz> wrote:
>
>
> > Here's a couple of updates for the MMP2 SoC devicetree files.
> > I'm wondering if they could be applied to the armsoc tree?
> >
> > Compared to previous submission, the only change is the addition of
> > Acks from Pavel.
>
> Any news here? Having up-to-date dts is kind-of useful....

Thanks for adding me to Cc on your reply. I'm doing the merged for 5.4
and had not noticed this series earlier (I found the mmp3 series by
accident, but that one looked like it was not meant as a submission
for inclusion yet).

I've added the six patches to the arm/late branch in the soc tree
now, they will be in 5.4.

Lubomir, please send all future submissions to soc@kernel.org
(with Cc: to the interested parties) when you want them to be
included in the soc tree. That way they show up in patchwork
and won't get lost.

       Arnd
