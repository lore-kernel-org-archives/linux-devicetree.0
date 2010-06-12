From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Fri, 11 Jun 2010 18:48:21 -1000
Message-ID: <4C131195.1000009@firmworks.com>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>	<33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<1276311487.1962.172.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1276311487.1962.172.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Benjamin Herrenschmidt wrote:
> On Fri, 2010-06-11 at 16:47 -0700, Dan Malek wrote:
>   
>> Hi Grant.
>>
>> On Jun 11, 2010, at 3:59 PM, Grant Likely wrote:
>>
>>     
>>> I've been doing a bit of work on some introductory level documentation
>>> of the flattened device tree.
>>>       
>> Wow, I feel empowered to create device trees now :-)
>> Seriously, I never understood this well and this is a
>> great document.
>>
>> I have one source of confusion.  Your first Initial structure
>> example uses 'compatible' to describe the machine, the
>> paragraph below then mentions the 'model' property,
>> and all subsequent examples use model.
>>
>> Does this mean if I use just the single line in the dts,
>> using 'compatible' implies the ARM machine ID?  If I
>> have more description I use 'model'?
>>     
>
> Normally, "compatible" is what is used for code to match,
> and model is more like a user-visible thingy.
>   

Indeed, one common use of "model" - at least in the systems I work on - 
is to display the name of the machine in a system identification banner 
that the user sees.
> It's possible to peek at 'model' tho, in some cases, I've seen the case
> for example where things are -supposed- to be identical from an arch
> point of view, have the same compatible, but later on, a quirk is found
> and a test against model is used to differentiate. But that's something
> to avoid in general. Better off having multiple strings in "compatible"
> then, one more "generic" to have the BSP match against, and one more
> "specific" that can be used if a quirk is needed.
>
> Of course, it doesn't help that all pseries have "chrp" and nothing else
> as compatible :-) But then, both IBM and Apple have been quite lax with
> their (ab)use of the DT.
>
> Cheers,
> Ben.
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>   
