From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Pinmux with device tree
Date: Wed, 18 May 2011 09:33:22 -1000
Message-ID: <4DD41F02.4050108@firmworks.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/18/2011 6:34 AM, Simon Glass wrote:
> Hi,
>
> I see a new pinmux system in the LKML. Has anyone looked at how to
> represent pinmux settings in the device tree?
>
> On a related topic, the examples that are used for GPIOs assume a
> flags word which describes things like pull-ups, direction, etc. This
> seems pretty cumbersome and gets worse with pinmuxes. People editing
> the device trees want to see symbolic information rather than a coded
> number, a bit like a #define. I can see this can be done with strings
> but this is inefficient in time and space, and is error-prone.  Is
> there support for this in device trees that I have missed?

Open Firmware deals with this by defining both a numerical 
representation and a text representation.  The numerical representation 
appears in memory in device tree property values, and the corresponding 
text representation is for display and human input.

It primarily applies to unit addresses, i.e. the "reg" property value, 
but the idea generalizes.  The device tree compiler could accept the 
symbolic names, converting them into well-defined bitfield values which 
would be stored in integer cells within property values.



>
> Regards,
> Simon
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
