From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 15:43:11 +0000
Message-ID: <20121123154311.GA28552@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
 <20121122112451.GE4328@gmail.com>
 <CAKohpo=EWFNddjMNwHO4u4-bi1AQ4cvsJ4DfFOgaFv3oVfheZg@mail.gmail.com>
 <20121123093633.GD17471@gmail.com>
 <CAKohpo=4orAgwVRRvukj+tu67CyVvoUegsJ7eXaCMA9exruqEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=4orAgwVRRvukj+tu67CyVvoUegsJ7eXaCMA9exruqEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Viresh Kumar wrote:

> On 23 November 2012 15:06, Lee Jones <lee.jones@linaro.org> wrote:
> > On Fri, 23 Nov 2012, Viresh Kumar wrote:
> >>       pdev =3D platform_device_alloc(cell->name, id + cell->id);
> >>
> >> This is required when we have multiple instances of MFD device pre=
sent
> >> on board. How do you want me to handle this ?
> >
> > There are lots of examples of this already. I have to leave somethi=
ng
> > to the imagination, or I'll be requesting a cut of your salary. :D
>=20
> My manager already reduced my salary by 20% after reading this mail :=
(

Ah, Good.=20

Tell your manager I'll send my offshore bank details over soon. :)

> Ok, this is what my understanding of whole this is. Platform devices =
are
> named like:
> - pdev-name: if id passed in pdev.id is -1
> - pdev-name.0[1|2|...]: if id passed is 0[1|2|...]
> - pdev-name.<dynamically allocated by kernel>: if id passed is -2
>=20
> Now, we don't declare cell->id fields and they are currently zero and=
 so
> value is passed from pdata->id field. So, for example with multiple i=
nstances
> of stmpe on a board, we have:
>=20
> - stmpe-0: //Name just for reference...
>    - stmpe-gpio.0
>    - stmpe-ts.0
> - stmpe-1:
>    - stmpe-gpio.1
>    - stmpe-ts.1
> - stmpe-2:
>    - stmpe-gpio.2
>    - stmpe-ts.2
>=20
> I main idea is to distinguish various instances of sub modules, like =
stmpe-gpio.
> And this works well with non-DT support we have currently.

Yes, when !DT, then passing ID is no problem.

> With DT, i am not sure how should we pass id field to mfd_add_devices=
(). If
> we pass it -1, then multiple instances will have same name: "stmpe-gp=
io"

No, in DT devices named as part of the hiearchy, so you'd have:

soc-u9500/i2c@80004000/stmpe1601@40/stmpe_keypad
soc-u9500/i2c@80004000/stmpe1601@41/stmpe_keypad
=2E.. etc

The only time we need to be concerned is if one stmpe device can
handle more than one keypad, gpio controller, etc. Which I don't
think is the case.

> Sorry, for my lack of knowledge. Don't send another mail with salary =
cut
> suggestion as that will make it -40% in total ;)

Ah, I promise I'll spend it wisely. :)

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
