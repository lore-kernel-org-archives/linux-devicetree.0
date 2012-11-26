From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V1 1/3] mfd: stmpe: Arrange #include <header files> in
 alphabetical order
Date: Mon, 26 Nov 2012 15:31:45 +0000
Message-ID: <20121126153145.GC6824@gmail.com>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <20121126111639.GR12685@sortiz-mobl>
 <CAKohpo=EpjP4gpbBTV8BaghCjLVC4x4wvgRW34M9pn0oZ-S5dw@mail.gmail.com>
 <20121126132557.GA6824@gmail.com>
 <CAKohpo=7CEbKgEQ8KbnVpS0Opxn9xjDP26atZBefgHcxXVbMkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=7CEbKgEQ8KbnVpS0Opxn9xjDP26atZBefgHcxXVbMkA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com
List-Id: devicetree@vger.kernel.org

On Mon, 26 Nov 2012, Viresh Kumar wrote:

> On 26 November 2012 18:55, Lee Jones <lee.jones@linaro.org> wrote:
>=20
> > Why do you need to sort them? Is there _really_ a need?
>=20
> Many people & maintainers like to have their header files ordered. Th=
e
> reason for that is:
>=20
> If they are not ordered, there is a possibility of adding an header f=
ile
> multiple times in a file. This might not do something serious
> when thinking about compilation time or Image size, but adding an hea=
der
> file multiple times is simply wrong.
>=20
> This can't be caught in patch reviews most of the time, as diff may n=
ot show
> the earlier inclusion.
>=20
> That's why i ordered them. And i don't see any harm in doing so.

I don't see any harm in it, but it's pretty pointless.

There aren't many maintainers who insist on such things, and the
ones that do normally carry out these OCD actions themselves. :)

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
