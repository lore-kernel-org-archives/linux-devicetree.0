From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Allow dtc to decompile device tre blobs in hexdump format
Date: Sun, 4 Apr 2010 16:01:24 -0600
Message-ID: <y2yfa686aa41004041501id8fb3268n72e31151055cb970@mail.gmail.com>
References: <20100404042232.GN8865@yookeroo>
	<y2vfa686aa41004032330xa771e6d5tdc8550fb9d451433@mail.gmail.com>
	<20100404211153.GC27285@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100404211153.GC27285@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 4, 2010 at 3:11 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Apr 04, 2010 at 12:30:15AM -0600, Grant Likely wrote:
>> On Sat, Apr 3, 2010 at 10:22 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > When debugging handoffs between different boot stages which use
>> > flattened device trees to communicate, it's often useful to dump the
>> > device tree blob being passed and use dtc to decompile it to something
>> > readable. =A0However, with some debugging tools it's possible to perfo=
rm
>> > a hex memory dump of the device tree, but it's awkward or impossible
>> > to directly dump the memory as a binary blob.
[...]
>>
>> Does it really make sense to build marshaling tools into dtc itself?
>
> Well.. is it essential that dtc do this? =A0Clearly not. =A0Is it a
> sufficient convenience that it's worth it? =A0Maybe.
>
>> I think it would make more sense to keep transformation tools
>> independent. =A0ie. what if I have srecord format? =A0or intel hex?
>
> If they're a) sufficiently widely used, b) not to hard to implement
> and c) there aren't widely used existing conversion tools then I would
> have no problem with adding support for such formats to.
>
>> A
>> trivial python or perl script would do the job for raw hex.
>
> I've written that trivial python or perl script too darn many times,
> and I'm sick of it. =A0I can't be the only one.

Oh, I agree.  I don't like reimplementing tools over and over again
either.  What I'm saying is rather than increasing the complexity of
the core dtc codebase, make it a separate script and store it inside
the dtc repo so it is available to all who need it.

>> =A0The
>> ascii2binary tool should also work. =A0Also, objcopy handles
>> srecord/ihex conversion beautifully.
>
> Ah, I wasn't previously aware of ascii2binary. =A0If it's flexible
> enough, that might well undermine the justification for this patch.

:-)

g.
