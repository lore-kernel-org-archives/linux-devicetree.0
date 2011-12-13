From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Tue, 13 Dec 2011 10:54:58 -0700
Message-ID: <CACxGe6t50zJNpo=QWPzgFMpQ6Cfi9YZyrKuMSTrrA2oYiLF2Pw@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20111212232903.GC2616@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111212232903.GC2616@gallagher>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2011 at 4:29 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> Hi Grant,
>
> I'm still going through these and trying to digest them but a couple of
> quick questions/comments.
>
> Jamie
>
> On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt =
b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> new file mode 100644
>> index 0000000..e40c436
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -0,0 +1,114 @@
>> +This binding is a work-in-progress, and are based on some experimental
>> +work by benh[1].
>> +
>> +Sources of clock signal can be represented by any node in the device
>> +tree. =A0Those nodes are designated as clock providers. =A0Clock consum=
er
>> +nodes use a phandle and clock specifier pair to connect clock provider
>> +outputs to clock inputs. =A0Similar to the gpio specifiers, a clock
>> +specifier is an array of one more more cells identifying the clock
>> +output on a device. =A0The length of a clock specifier is defined by the
>> +value of a #clock-cells property in the clock provider node.
>> +
>> +[1] http://patchwork.ozlabs.org/patch/31551/
>> +
>> +=3D=3DClock providers=3D=3D
>> +
>> +Required properties:
>> +#clock-cells: =A0 =A0 =A0 =A0 =A0 Number of cells in a clock specifier;=
 typically will be
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set to 1
>
> I'm not sure I fully understand what the extra cells actually mean for
> clocks. =A0I think the first integer is the clock output to use but some
> of the versatile and highbank ones only have a phandle or is it more
> implementation defined? =A0The clock-output-names description hints at
> recommended, so I find this a little confusing, but that could just be
> me!

I'm following convention here that has been established with
interrupts, gpios, and others.  Sometimes more information is needed
that just the clock number.  Using #clock-cells gives a clock provider
the option of having additional fields for clock flags or other data.
This is very much implementation defined.  Simple clock providers that
only have a single clock output can easily use #clock-cells =3D <0>.
Providers with multiple outputs will need to use 1 or more cells.

>> +Optional properties:
>> +clock-output-names: Recommended to be a list of strings of clock output=
 signal
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 names indexed by the first cell in the=
 clock specifier.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 However, the meaning of clock-output-n=
ame is domain
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 specific to the clock provider, and is=
 only provided to
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 encourage using the same meaning for t=
he majority of clock
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 providers. =A0This format may not work=
 for clock providers
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 using a complex clock specifier format=
. =A0In those cases it
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is recommended to omit this property a=
nd create a binding
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 specific names property.
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Clock consumer nodes must never directl=
y reference
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0the provider's clock-output-name proper=
ty.
>> +
>> +For example:
>> +
>> + =A0 =A0oscillator {
>> + =A0 =A0 =A0 =A0#clock-cells =3D <1>;
>> + =A0 =A0 =A0 =A0clock-output-names =3D "ckil", "ckih";
>> + =A0 =A0};
>> +
>> +- this node defines a device with two clock outputs, the first named
>> + =A0"ckil" and the second named "ckih". =A0Consumer nodes always refere=
nce
>> + =A0clocks by index. The names should reflect the clock output signal
>> + =A0names for the device.
>> +
>> +=3D=3DClock consumers=3D=3D
>> +
>> +Required properties:
>> +clocks: =A0 =A0 =A0 =A0 =A0 =A0 =A0List of phandle and clock specifier =
pairs, one pair
>> + =A0 =A0 =A0 =A0 =A0 =A0 for each clock input to the device.
>
> Some of the highbank and versatile devicetree nodes have clocks
> properties that aren't a pair e.g. versatile timer has
> "clocks =3D <&tim_clk>;".

It's still a pair.... it's just that the specifier portion has a zero
length.  :-)  I do agree that the documentation needs work though.

>
>> +clock-names: List of clock input name strings sorted in the same
>> + =A0 =A0 =A0 =A0 =A0 =A0 order as the clocks property. =A0Consumers dri=
vers
>> + =A0 =A0 =A0 =A0 =A0 =A0 will use clock-names to match clock input names
>> + =A0 =A0 =A0 =A0 =A0 =A0 with clocks specifiers.
>
> The versatile and highbank patches appears to omit this required
> property in several nodes. =A0So is this really optional?

You're right, it's not required.  I'll move it to optional.

g.
