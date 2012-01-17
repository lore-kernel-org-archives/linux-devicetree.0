From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Tue, 17 Jan 2012 16:49:04 -0700
Message-ID: <CACxGe6sULSJAw1fOs5VTw=LGuST9DY3-h4oZbWZRz_LAr3sWqA@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <74CDBE0F657A3D45AFBB94109FB122FF17801D2353@HQMAIL01.nvidia.com>
 <CACxGe6vC7DBW0w6LhRTg_fi5bZ2aHxwFY2DNbT6KFcUmoYpNYA@mail.gmail.com>
 <CAJOA=zMgGsZKGQ-EfSnXDY_WoFrzG6XPZtuxANFKqdL8CAaYrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJOA=zMgGsZKGQ-EfSnXDY_WoFrzG6XPZtuxANFKqdL8CAaYrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2012 at 4:37 PM, Turquette, Mike <mturquette-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, Jan 17, 2012 at 2:47 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> On Tue, Jan 17, 2012 at 1:44 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
>>> In other words, does the UART driver need to do something like:
>>>
>>> clk_reg =3D clk_get(dev, "register");
>>> clk_parent =3D of_clk_get_by_name(np, "register);
>>> clk_set_parent(clk_reg, clk_parent);
>>>
>>> Or will that all happen transparently within just the of_clk_get_by_name
>>> call?
>>>
>>> (I suppose this question makes slightly more sense for the PLL itself,
>>> since both the upstream and downstream clocks are represented in the PLL
>>> node, whereas the UART's node only represents the clock consumer side,
>>> so the above code isn't really possible automatically).
>>
>> The intent is that device only interacts with the leaf device. =A0If the
>> clocks are arranged into a hierarchy, then the clock driver is
>> responsible for any interactions with the parent clock. =A0Requiring the
>> driver to manipulate parent clocks directly defeats the purpose of
>> having a clock abstraction.
>
> I don't think that we can get rid of all instances of drivers knowing
> a bit about hierarchy. =A0I think we can get rid of most, but there are
> cases where it is valid for a driver to know some of the details.
> More on that below.
>
>>> Somewhat related to this: How does dynamic reparenting interact with
>>> the DT clock binding; is the DT just the default/initial clock setup,
>>> and anything beyond that needs a custom binding and code in the consume=
r?
>>
>> As far as the clock binding goes, it only describes provider/consumer
>> relationships. =A0The fact that such relationships may resolve to a
>> hierarchy is beyond what the binding describes. =A0If a clock has
>> multiple possible parents, then that specific clock binding should
>> document how the multiple parent clocks are described and the clock
>> driver is responsible for implementing the correct behaviour.
>
> It also deserves to be said that the DT data says nothing about which
> of the possible parents _should_ be the input to a mux clock. =A0It's
> pretty common to want to make changes to hierarchy after taking a
> device out of reset, since the reset values for a clock management IP
> might be pretty conservative. =A0So someone, somewhere must know some
> details about hierarchy and set things up correctly. =A0Maybe a "clock
> driver" can do this, but for specific IPs such as the audio example
> below it makes sense for that driver to have the knowledge.
>
>> Similarly, the DT clock binding provides no generic mechanism for
>> walking up the clock tree. =A0That behaviour must also be implemented by
>> each specific clock driver.
>>
>>> I'm thinking of say a system with 1 I2S controller, and both an internal
>>> and external I2S clock source, where perhaps the internal source needs
>>> to be used to capture from an I2S interface on one set of pins (e.g.
>>> analog mic) but the other clock source needs to be used to capture from
>>> I2S on another set of pins (e.g. digital baseband unit connection).
>>> (This example is theoretical, but I'm sure there are other dynamic clock
>>> cases in practice).
>>
>> That is a reasonable example. =A0In this case, the i2c controller would
>> include both in its clocks property, and the binding would document
>> when and why each clock source is used.
>
> I'm confused on this point. =A0How does the binding "document when and
> why each clock is used"? =A0In the case where this I2S controller
> expects to dynamically switch roles at run-time (analog mic versus
> baseband) then clk_set_parent must still be invoked by the driver. =A0To
> be clear I'm imagining the above example like:
>
> i_I2S =A0 e_I2S
> =A0 \ =A0 =A0 =A0 /
> =A0 =A0I2S_mux
> =A0 =A0 =A0 =A0|
> I2S controller IP

>From the description, I assumed that the i2s_mux was part of the i2s
controller driver which would select the appropriate clock based on
the configured mode.  If it is better to implement it as a separate
clock driver, then yes the i2s controller must have knowledge of that
and call clk_set_parent appropriately.  Regardless, some driver needs
to explicitly understand the relationship between pinmux and clock
source.

g.
