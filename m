From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 00/12] qcom: dts: thermal cleanups
Date: Wed, 20 Feb 2019 15:09:36 +0530
Message-ID: <CAP245DXn3db27wMPSaZazRhprXD89JKQ5qEkc8r0DpSL9A847w@mail.gmail.com>
References: <cover.1550493113.git.amit.kucheria@linaro.org> <20190220012641.GH2811@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220012641.GH2811@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 6:56 AM Eduardo Valentin <edubezval@gmail.com> wrote:
>
> Hey
> On Mon, Feb 18, 2019 at 06:05:14PM +0530, Amit Kucheria wrote:
> > - Expose all temperature sensors on msm8916, msm996, msm8998, sdm845
> > - split up the register address map for msm8998
> > - standardize names of the various thermal-zones across boards to make it
> >   easy for test scripts to parse
> >
>
> I am generally fine with the effort but please fix the following
> (applies for the whole series) wrt to required properties for DT
> thermal:
> a. Trip points for your zones

Thanks for the review.

In some cases, the temperatures are just exposed so something in
userspace might read it and do something with it. We don't expect
kernel trips for them.

Adding trip points also requires me to add cooling-maps (your point b. below).

I guess I'm looking for an example of how to just expose sensor
temperatures w/o any associated trips and cooling maps.

> b. Cooling Mappings for zones that have passive trips.
>

>From what I can see currently only CPUs and GPUs (among the major heat
sources) can passively reduce heat by reducing frequencies.

Things like cameras, display, video might have a more ON/OFF approach
to throttling that might be controlled from userspace. And we don't
have a way to tell in DT that these zones are managed in userspace
(https://patchwork.kernel.org/patch/10259487/)
