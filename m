From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC 6/8] of: add clock providers
Date: Wed, 16 Nov 2011 12:06:56 -0700
Message-ID: <CACxGe6tHF7K4y9FqUxYraK0pgRRtN671-pp3Z88SEj4nStQiCg@mail.gmail.com>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-7-git-send-email-grant.likely@secretlab.ca>
 <4EB9EA46.3030300@gmail.com> <20111114021359.GA25796@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111114021359.GA25796@b20223-02.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 13, 2011 at 7:14 PM, Richard Zhao <richard.zhao@linaro.org>=
 wrote:
> On Tue, Nov 08, 2011 at 08:49:42PM -0600, Rob Herring wrote:
>> > +For example:
>> > +
>> > + =A0 =A0oscillator {
>> > + =A0 =A0 =A0 =A0#clock-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0clock-output-name =3D "ckil", "ckih";
>> > + =A0 =A0};
>> > +
>> > +- this node defines a device with two clock outputs, the first na=
med
>> > + =A0"ckil" and the second named "ckih". =A0Consumer nodes always =
reference
>> > + =A0clocks by index. The names should reflect the clock output si=
gnal
>> > + =A0names for the device.
>> > +
>> > +=3D=3DClock consumers=3D=3D
>> > +
>> > +Required properties:
>> > +clock-input: =A0 =A0 =A0 List of phandle and clock specifier pair=
s, one pair
>> > + =A0 =A0 =A0 =A0 =A0 for each clock input to the device.
>> > +clock-input-name: List of clock input name strings sorted in the =
same
>> > + =A0 =A0 =A0 =A0 =A0 order as the clock-input property. =A0Consum=
ers drivers
>> > + =A0 =A0 =A0 =A0 =A0 will use clock-input-name to match clock inp=
ut names
>> > + =A0 =A0 =A0 =A0 =A0 with clock-input specifiers.
>> > +
>> > +For example:
>> > +
>> > + =A0 =A0uart {
>> > + =A0 =A0 =A0 =A0clock-input =3D <&osc 1> <&ref 0>;
>> > + =A0 =A0 =A0 =A0clock-input-name =3D "baud", "register";
>> > + =A0 =A0};
>>
>> This is duplicated below.

I'm okay with that. It's not entirely the same, and I think having
several examples is helpful.


>> > + =A0 =A0/* external oscillator */
>> > + =A0 =A0osc: oscillator {
>> > + =A0 =A0 =A0 =A0compatible =3D "fixed-clock";
>> > + =A0 =A0 =A0 =A0#clock-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0frequency =A0=3D <32678>;
>>
>> The code is using "clock-frequency" here.

=46ixed

>>
>> > + =A0 =A0 =A0 =A0clock-output-name =3D "osc";
>> > + =A0 =A0};
>> > +
>> > + =A0 =A0/* phase-locked-loop device, generates a higher frequency=
 clock
>> > + =A0 =A0 * from the external oscillator reference */
>> > + =A0 =A0pll: pll {
>> > + =A0 =A0 =A0 =A0compatible =3D "some-pll-interface"
>> > + =A0 =A0 =A0 =A0#clock-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0clock-input =3D <&osc 0>;
>>
>> There's a mismatch in #clock-cells size and this.
>
> osc #clock-cells is 1. "0" is one cell too. Nothing wrong. Correct my=
 understanding?

Richard is correct.  The #clock-cells value needs to be 1, which in
the clock binding means one cell for the phandle and one cell for the
attached arguments.  Exactly the same as the gpio binding.

>> > +static struct clk *__of_clk_get_from_provider(struct of_phandle_a=
rgs *clkspec)
>> > +{
>> > + =A0 struct of_clk_provider *provider;
>> > + =A0 struct clk *clk =3D NULL;
>> > +
>> > + =A0 /* Check if we have such a provider in our array */
>> > + =A0 mutex_lock(&of_clk_lock);
>> > + =A0 list_for_each_entry(provider, &of_clk_providers, link) {
>> > + =A0 =A0 =A0 =A0 =A0 if (provider->node =3D=3D clkspec->np)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk =3D provider->get(clkspe=
c, provider->data);
>>
>> How about:
>>
>> if (provider->get)
>> =A0 =A0 =A0 clk =3D provider->get(clkspec, provider->data);
>> else
>> =A0 =A0 =A0 clk =3D provider->data;

I'd rather make it a requirement for every clock driver to provide the
get hook; even if it uses a stock version that simply returns ->data.

Thanks for the review.

g.
