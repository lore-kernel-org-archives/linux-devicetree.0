From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Wed, 5 Dec 2012 13:19:04 +0000
Message-ID: <20121205131904.GJ2718@gmail.com>
References: <2dcd7cb4c4022fa24b5328974e4226f5aaf89419.1354199865.git.viresh.kumar@linaro.org>
 <121653def4e985b0c1b59045637dd4518f97e73a.1354199865.git.viresh.kumar@linaro.org>
 <20121130105731.GN3176@sortiz-mobl>
 <20121130154542.GG23648@gmail.com>
 <CAKohpokLVEH+4F_VXh5auUm48cWWe0mumZME8yOCcAezcwJbCQ@mail.gmail.com>
 <CAKohpom-9fFwvCQXdJNXELZC1rfDT0-N+XoYQdTOG2Mo=SyiYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpom-9fFwvCQXdJNXELZC1rfDT0-N+XoYQdTOG2Mo=SyiYw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: grant.likely@secretlab.ca, Samuel Ortiz <sameo@linux.intel.com>, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

> Ping!!!

Documentation/development-process/2.Process:

- Avoid top-posting (the practice of putting your answer above the quot=
ed
  text you are responding to).  It makes your response harder to read a=
nd
  makes a poor impression.

:)

> On 1 December 2012 00:33, Viresh Kumar <viresh.kumar@linaro.org> wrot=
e:
> > On 30 November 2012 21:15, Lee Jones <lee.jones@linaro.org> wrote:
> >> But ... I don't see how the changes in the -i2c and -spi files
> >> are of benefit either. When I boot without the ID table I still
> >> get "stmpe-i2c 0-0040: stmpe1601 detected, chip id: 0x212".
> >>
> >> What is it that actually uses the IDs?
> >>
> >> Perhaps Viresh can shine some light on the matter?
> >
> > As you can see, i wasn't the author of this patch and when you aske=
d
> > this question, i didn't had an answer to it. I went through code an=
d
> > formed some theory/story :) .
> >
> > @Grant: i need your help to check if my theory is correct or not. Q=
uestion
> > is about adding below code in any i2c client driver:
> >
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id stmpe_dt_ids[] =3D {
> > +       { .compatible =3D "st,stmpe610", .data =3D &stmpe_i2c_id[0]=
, },
> > +       { .compatible =3D "st,stmpe801", .data =3D &stmpe_i2c_id[1]=
, },
> > +       { .compatible =3D "st,stmpe811", .data =3D &stmpe_i2c_id[2]=
, },
> > +       { .compatible =3D "st,stmpe1601", .data =3D &stmpe_i2c_id[3=
], },
> > +       { .compatible =3D "st,stmpe2401", .data =3D &stmpe_i2c_id[4=
], },
> > +       { .compatible =3D "st,stmpe2403", .data =3D &stmpe_i2c_id[5=
], },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, stmpe_dt_ids);
> > +#endif
> > +
> >  static struct i2c_driver stmpe_i2c_driver =3D {
> >         .driver =3D {
> >                 .name =3D "stmpe-i2c",
> > @@ -88,6 +102,7 @@ static struct i2c_driver stmpe_i2c_driver =3D {
> >  #ifdef CONFIG_PM
> >                 .pm =3D &stmpe_dev_pm_ops,
> >  #endif
> > +               .of_match_table =3D of_match_ptr(stmpe_dt_ids),
> >
> > So, what is the use of this table when we already have i2c_driver.i=
d_table
> > populated.
> >
> > This is my theory:
> > ---------------------
> > Adapter drivers supporting DT will call:
> > of_i2c_register_devices()
> > {
> >         for_each_child_of_node(adap->dev.of_node, node) {
> >                 if (of_modalias_node(node, info.type, sizeof(info.t=
ype)) < 0)
> >                      error condition
> >
> >                 ...
> >                 result =3D i2c_new_device(adap, &info);
> >
> >           ...
> > }
> >
> > of_modalias_node(): expects compatible in child node, i.e. stmpe no=
de in our
> > case. If it is not there, then that node is skipped. then it copies
> > string after ','
> > to info.type. So, for us only "stmpe810" out of "st,stmpe810" is co=
pied.
> >
> > Now this name, i.e. "stmpe810" is copied as client.name in i2c_new_=
device()
> > and device_register() is called, which will eventually call:
> >
> > i2c_device_match()
> > {
> >         /* Attempt an OF style match */
> >         if (of_driver_match_device(dev, drv))
> >                 return 1;
> >
> >         driver =3D to_i2c_driver(drv);
> >         /* match on an id table if there is one */
> >         if (driver->id_table)
> >                 return i2c_match_id(driver->id_table, client) !=3D =
NULL;
> > }
> >
> > This first tries to match the table my patch added, _BUT_ the strin=
g will
> > never match as we had "st,stmpe810" in table and "stmpe810" in dev.
> >
> > So, we fall back to i2c_match_id(), which will match it against
> > i2c_driver.id_table present in driver, which has entry for "stmpe81=
0" and
> > so strings matched.
> >
> > @Lee: This is what happened in your case. :)
> >
> > So, whether its DT or non DT, true is returned from here if somethi=
ng
> > matched.
> >
> > Later on, this will be called:
> >
> > static int i2c_device_probe(struct device *dev)
> > {
> >         .....
> >         status =3D driver->probe(client, i2c_match_id(driver->id_ta=
ble, client));
> >         ....
> > }
> >
> > Which will again match the legacy table to find correct struct i2c_=
device_id *id
> > to pass to probe().
> >
> > So, the final question: WTF is of_match_table for?
> >
> > Then i thought maybe it is used when  we don't have child nodes ins=
ide parent,
> > something related to the phandle way ? I grep'd i2c in arch/arm/boo=
t/dts and
> > couldn't find anything of that sort, the way i2c clients are added =
is:
> >
> > in dtsi file:
> >
> > i2c0: i2c@address {
> >          ...
> > }
> >
> > in dts file:
> > &i2c0 {
> >           stmpe810 {
> >           ........
> >           }
> > }
> >
> > which i believe will be taken care by dtc and will fold client node=
s
> > as child nodes
> > of i2c0.
> >
> > @Grant: Please throw some light here :)
> >
> > --
> > viresh

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
