From: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during boot
	(v2)
Date: Thu, 18 Nov 2010 07:04:04 -0800
Message-ID: <4CE54064.6010702@zytor.com>
References: <20101111214546.4e573cad@queued.net>	 <reply-olpc-3-v2@mdm.bga.com>
	<20101112002704.50c629e2@queued.net>	
	<20101114095013.GB24206@elte.hu> <4CE0B54E.6000101@zytor.com>	
	<20101115070254.GA25243@elte.hu> <4CE17133.2050101@zytor.com>	
	<20101118083420.GC26398@elte.hu>
	<1290078135.22575.4.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290078135.22575.4.camel@concordia>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/18/2010 03:02 AM, Michael Ellerman wrote:
> On Thu, 2010-11-18 at 09:34 +0100, Ingo Molnar wrote:
>>
>> Look at the general balance of hardship: very little harm is done (it's not a big 
>> deal if a variable is only used in a single function) but having it with local 
>> variables can be _really_ harmful - for example i overlooked them when i reviewed 
>> this patch. I dont like important details obscured - i like them to be apparent. 
>> Again, this is something that some people can parse immediately on the visual level 
>> - me and many others cannot.
> 

No, sorry, this sounds like a personal preference that is well out of
line with the vast majority of C programmers I've ever come across, not
just in the Linux kernel world but outside of it.

> What about:
> 
> int foo(void)
> {
> 	static int bar;
> 
> 	struct thing_struct *thing;
> 	int other_var;
> 	char *p;
> 
> 	...
> }
> 
> I think the visual wrongness of that formatting would be enough for me
> to stop and look twice. Though I guess it doesn't work if you have few,
> or no other variables other than the statics to declare.
> 

I wouldn't object to a convention like that, but let's bloody well
realize that that is a brand new convention, and if this convention is
going to stick at all it needs to be made official and put in CodingStyle.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
