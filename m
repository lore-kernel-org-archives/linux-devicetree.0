From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Tue, 15 Sep 2009 17:07:47 -0600
Message-ID: <fa686aa40909151607u29d4025ay101e89d9eae5f30a@mail.gmail.com>
References: <4AAFDDD1.9070702@monstr.eu>
	<fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
	<1d3f23370909151540p411f0bc0r1c81b68ceb2fb45e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1d3f23370909151540p411f0bc0r1c81b68ceb2fb45e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2009 at 4:40 PM, John Williams
<john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org> wrote:
> Hi Grant,
>
> On Wed, Sep 16, 2009 at 8:27 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> On Tue, Sep 15, 2009 at 12:32 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>>> For this node there should be better reset description not just label w=
ith different description.
>>> I expect that it will be useful soft and hard reset and maybe you can f=
ind some others.
>>
>> It sounds like what you are doing is very board specific. =A0It is
>> probably premature to design a 'generic' binding for something that
>> may very well not turn out to be very generic at all.
>
> On the contrary - the MicroBlaze CPU itself has no provision for a
> self-initiated soft reset. =A0Instead, the way it is achieved is by
> connecting one bit of a GPIO to the AUX_RESET input of Xilinx's
> proc_sys_reset IP (also used in PPC designs as you know). =A0We are
> looking for a sensible, flexible way of binding this structure that we
> instantiate in almost all MicroBlaze Linux systems.
>
> BTW - how do you handle soft-reset on Xilinx/PPC designs?

It writes the reset command to the DBCR special purpose register.  The
PPC440 core reset output is wired to the RESETPPC0 bus input on the
proc_sys_reset core (which actually consists of three reset request
lines IIRC).

>> What I'd do is
>> create yourself a node for holding board specific properties (like the
>> binding to the gpio reset line) and parse that data from your board
>> specific setup code. =A0I suppose you could also do it from an
>> of_platform driver, but like irq controllers, it probably doesn't make
>> a lot of sense to.
>
> We are trying to avoid board-specific platform code at all costs - the
> ability to fully configure a standard kernel onto arbitrary boards via
> a DTB is proving very useful, and as I said above we see this
> reset-gpio capability as a generic thing that will be used across many
> platforms. =A0We just want to do it right.

okay

> Given my justification above, can you spare some of your bountiful
> neurons on considering how we might do it generically? =A0Does flattery
> work on you? :)

:-P

>From what I've heard so far, I'd do it the same way but use something
like "xlnx,microblaze-gpio-reset" for the compatible value.  As long
as you document the binding and post it to the devicetree-discuss
mailing list for review you should have no problem doing what you want
to do.

BTW, start with the "xlnx,microblaze-*" value for now.  A architecture
neutral value can always be chosen at a later date if this proves to
be useful.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
