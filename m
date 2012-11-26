From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V1 1/3] mfd: stmpe: Arrange #include <header files> in
 alphabetical order
Date: Mon, 26 Nov 2012 13:25:57 +0000
Message-ID: <20121126132557.GA6824@gmail.com>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <20121126111639.GR12685@sortiz-mobl>
 <CAKohpo=EpjP4gpbBTV8BaghCjLVC4x4wvgRW34M9pn0oZ-S5dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=EpjP4gpbBTV8BaghCjLVC4x4wvgRW34M9pn0oZ-S5dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com
List-Id: devicetree@vger.kernel.org

On Mon, 26 Nov 2012, Viresh Kumar wrote:

> On 26 November 2012 16:46, Samuel Ortiz <sameo@linux.intel.com> wrote=
:
> > Hi Viresh,
> >
> > On Fri, Nov 23, 2012 at 12:26:18AM +0530, Viresh Kumar wrote:
> >> This helps managing them better and also reduces chances of adding=
 an header
> >> file twice.
>=20
> The aim is to maintain the list of header files in alphabetical order=
=2E
> It helps in maintaining
> them.. I was adding some header files for my 3rd patch and was lookin=
g
> for the best
> place to add them and because the list wasn't sorted, i sorted it out
> in a separate patch.

Why do you need to sort them? Is there _really_ a need?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
