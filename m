From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Thu, 15 Dec 2011 10:37:19 -0700
Message-ID: <CACxGe6t1UyzKhUGQXyYvKd-iNQJNCR7dXUra6pAE-LF_UCNSuw@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20111212232903.GC2616@gallagher>
 <CACxGe6t50zJNpo=QWPzgFMpQ6Cfi9YZyrKuMSTrrA2oYiLF2Pw@mail.gmail.com>
 <20111215135129.GA2831@S2100-06.ap.freescale.net> <4EEA02D5.9020309@gmail.com>
 <20111215151335.GB2831@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111215151335.GB2831-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2011 at 8:13 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Thu, Dec 15, 2011 at 08:23:17AM -0600, Rob Herring wrote:
>>
>>
>> On 12/15/2011 07:51 AM, Shawn Guo wrote:
>> > On Tue, Dec 13, 2011 at 10:54:58AM -0700, Grant Likely wrote:
>> >> On Mon, Dec 12, 2011 at 4:29 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wro=
te:
>> >>> Hi Grant,
>> >>>
>> >>> I'm still going through these and trying to digest them but a couple=
 of
>> >>> quick questions/comments.
>> >>>
>> >>> Jamie
>> >>>
>> >>> On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
>> >>>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings=
.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> >>>> new file mode 100644
>> >>>> index 0000000..e40c436
>> >>>> --- /dev/null
>> >>>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> >>>> @@ -0,0 +1,114 @@
>> >>>> +This binding is a work-in-progress, and are based on some experime=
ntal
>> >>>> +work by benh[1].
>> >>>> +
>> >>>> +Sources of clock signal can be represented by any node in the devi=
ce
>> >>>> +tree. =A0Those nodes are designated as clock providers. =A0Clock c=
onsumer
>> >>>> +nodes use a phandle and clock specifier pair to connect clock prov=
ider
>> >>>> +outputs to clock inputs. =A0Similar to the gpio specifiers, a clock
>> >>>> +specifier is an array of one more more cells identifying the clock
>> >>>> +output on a device. =A0The length of a clock specifier is defined =
by the
>> >>>> +value of a #clock-cells property in the clock provider node.
>> >>>> +
>> >>>> +[1] http://patchwork.ozlabs.org/patch/31551/
>> >>>> +
>> >>>> +=3D=3DClock providers=3D=3D
>> >>>> +
>> >>>> +Required properties:
>> >>>> +#clock-cells: =A0 =A0 =A0 =A0 =A0 Number of cells in a clock speci=
fier; typically will be
>> >>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set to 1
>> >>>
>> >>> I'm not sure I fully understand what the extra cells actually mean f=
or
>> >>> clocks. =A0I think the first integer is the clock output to use but =
some
>> >>> of the versatile and highbank ones only have a phandle or is it more
>> >>> implementation defined? =A0The clock-output-names description hints =
at
>> >>> recommended, so I find this a little confusing, but that could just =
be
>> >>> me!
>> >>
>> >> I'm following convention here that has been established with
>> >> interrupts, gpios, and others. =A0Sometimes more information is needed
>> >> that just the clock number. =A0Using #clock-cells gives a clock provi=
der
>> >> the option of having additional fields for clock flags or other data.
>> >> This is very much implementation defined. =A0Simple clock providers t=
hat
>> >> only have a single clock output can easily use #clock-cells =3D <0>.
>> >> Providers with multiple outputs will need to use 1 or more cells.
>> >>
>> > It totally destroys my understanding on #clock-cells :)
>> >
>> > I thought it's introduced to reduce the clock nodes in dts. =A0That sa=
id,
>> > #clock-cells stands for the number of clks we describe in the node.
>> > When #clock-cells > 1 for a node, the node becomes a clk blob which
>> > actually contains multiple clks. =A0I migrated the imx6 clock to your
>> > first post with this approach [1], using 70 nodes to describe 110
>> > clocks (~35% nodes reduced).
>> >
>> > Now, you are saying it's not designed for this purpose. =A0I'm pretty
>> > confused, because the only reasonable use of #clock-cells to me is
>> > just that way, and I fail to see why we need #clock-cells if we do
>> > not use it that way.
>> >
>> > http://comments.gmane.org/gmane.linux.drivers.devicetree/9631
>>
>> Think of clock-cells as the size of array elements (minus 1), not the
>> number of array elements. If you have more than 1 clock per node, then
>> you need more information on the clock input side than just a phandle to
>> describe which clock you are using. Typically this would just be the
>> phandle plus index of the clock you want. This is just like gpio where
>> you have controller phandle plus gpio line number.
>>
> It seems I misunderstood/misused the #clock-cells. =A0So even we have
> multiple clks embedded in a node, #clock-cells=3D1 works for most of the
> cases, since what really matters is just the index of the clk we want
> the phandle to point to. =A0And the clock driver has to figure out how
> many clks are in there by some other means. =A0Correct me please, if I
> still misunderstand it.

Yes, it sounds like you have it right.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
