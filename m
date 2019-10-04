From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
Date: Thu, 3 Oct 2019 21:14:14 -0600
Message-ID: <CAOCk7NqF3+34aM-SG30mevUx6PWyvByrvRHCgAJpZ8z0JGy++A@mail.gmail.com>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
 <20191002091950.GA9393@centauri> <20191002092734.GA15523@centauri>
 <CAOCk7Nqqm6d3bR9hFJH6rp1jMPmx2e2qmJtnOuw5viaGWohEZA@mail.gmail.com> <CAHLCerN6T2WszczwDOeg=F2MQ3hHBkgYubCu9WyuhsOaAR=mMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHLCerN6T2WszczwDOeg=F2MQ3hHBkgYubCu9WyuhsOaAR=mMg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, lkml <linux-kernel@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Sibi Sankar <sibis@codeaurora.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 7:36 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> On Wed, Oct 2, 2019 at 11:48 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Wed, Oct 2, 2019 at 3:27 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > >
> > > On Wed, Oct 02, 2019 at 11:19:50AM +0200, Niklas Cassel wrote:
> > > > On Mon, Sep 30, 2019 at 04:20:15PM -0600, Jeffrey Hugo wrote:
> > > > > Amit, the merged version of the below change causes a boot failure
> > > > > (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> > > > > enough, it seems to be resolved if I remove the cpu-idle-states
> > > > > property from one of the cpu nodes.
> > > > >
> > > > > I see no issues with the msm8998 MTP.
> > > >
> > > > Hello Jeffrey, Amit,
> > > >
> > > > If the PSCI idle states work properly on the msm8998 devboard (MTP),
> > > > but causes crashes on msm8998 laptops, the only logical change is
> > > > that the PSCI firmware is different between the two devices.
> > >
> > > Since the msm8998 laptops boot using ACPI, perhaps these laptops
> > > doesn't support PSCI/have any PSCI firmware at all.
> >
> > They have PSCI.  If there was no PSCI, I would expect the PSCI
> > get_version request from Linux to fail, and all PSCI functionality to
> > be disabled.
> >
> > However, your mention about ACPI sparked a thought.  ACPI describes
> > the idle states, along with the PSCI info, in the ACPI0007 devices.
> > Those exist on the laptops, and the info mostly correlates with Amit's
> > patch (ACPI seems to be a bit more conservative about the latencies,
> > and describes one additional deeper state).  However, upon a detailed
> > analysis of the ACPI description, I did find something relevant - the
> > retention state is not enabled.
> >
> > So, I hacked out the retention state from Amit's patch, and I did not
> > observe a hang.  I used sysfs, and appeared able to validate that the
> > power collapse state was being used successfully.
>
> Interesting that the shallower sleep state was causing problems.
> Usually, it is the deeper states that cause problems. So you plan to
> override the idle states table in the board-specific DT?

Yes.  Already posted.

>
> Why does the platform even rely on DT? Shouldn't we use the ACPI tables instead?

In theory, yes.  However the ACPI seems to be incomplete (assumes
things are just hardcoded in the driver maybe?) and has tons of
non-standard things in it.  DT seems to be the easy path to
enablement.
>
> > I'm guessing that something is weird with the laptops, where the CPUs
> > can go into retention, but not come out, thus causing issues.
> >
> > I'll post a patch to fix up the laptops.  Thanks for all the help.
