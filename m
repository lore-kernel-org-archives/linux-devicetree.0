From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 09:39:31 +0000
Message-ID: <20121123093931.GE17471@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
 <20121122112451.GE4328@gmail.com>
 <CAKohpo=7NRGH+XcgY3Adb8pestDLCnFiTJ-B3P61QAHN4Y_Kvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=7NRGH+XcgY3Adb8pestDLCnFiTJ-B3P61QAHN4Y_Kvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Viresh Kumar wrote:

> On 22 November 2012 16:54, Lee Jones <lee.jones@linaro.org> wrote:
> >> diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Doc=
umentation/devicetree/bindings/mfd/stmpe.txt
> >> +Optional properties:
> >> +- irq-trigger: IRQ trigger to use for the interrupt to the host
> >> +- irq-invert-polarity: bool, IRQ line is connected with reversed =
polarity
> >
> > Are these new?
> >
> > When adding new bindings, ask yourself:
>=20
> I was trying to get information of these two bindings from other sour=
ces,
> but couldn't find. The only other place can be the interrupts field, =
right?

Bingo. Continue along this thread.

> Because interrupts field depends on the interrupt controller, which c=
an
> be a wide variety of controllers in our case, we can't use that. Also=
,
> the cells of interrupts field will have something that is required to=
 be
> programmed in the interrupt controller and not in the user of IC.
>=20
> But here we are talking about programming stmpe and so these bindings
> are very much required in stmpe only.

Not true.

Hint: `git grep triggered -- Documentation/devicetree/`

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
