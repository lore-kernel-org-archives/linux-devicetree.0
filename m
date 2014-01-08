From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: Add support for S2MPA01 device
Date: Wed, 8 Jan 2014 09:27:31 +0000
Message-ID: <20140108092731.GF19974@lee--X1>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
 <20140108090208.GD19974@lee--X1>
 <CAK9yfHyDNfRcn4J6N5u=CbVHsRqCp5LSgUavsD1p7Gjp+m9dfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK9yfHyDNfRcn4J6N5u=CbVHsRqCp5LSgUavsD1p7Gjp+m9dfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, Liam Girdwood <lgirdwood@gmail.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, Sangbeom Kim <sbkim73@samsung.com>, Patch Tracking <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

> >> @@ -92,7 +93,7 @@ struct sec_platform_data {
> >>       int                             buck3_default_idx;
> >>       int                             buck4_default_idx;
> >>
> >> -     int                             buck_ramp_delay;
> >> +     int                             buck_ramp_delay;
> >
> > What's this? Are you fixing (or breaking) white space here?
>=20
> I didn't get you. I have converted spaces to tabs here. See some prob=
lem?

No problem. It was unclear in the patch, as white space changes do not
show up in my mail client.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
