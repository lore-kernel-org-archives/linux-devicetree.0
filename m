From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc: document the FSL MPIC message register
	binding
Date: Tue, 31 May 2011 14:19:51 -0500
Message-ID: <4DE53F57.2050402@mentor.com>
References: <1305909399-26969-1-git-send-email-meador_inge@mentor.com>	<1305909399-26969-2-git-send-email-meador_inge@mentor.com>
	<20110526150643.3e01f9a6@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110526150643.3e01f9a6-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/26/2011 03:06 PM, Scott Wood wrote:
>> > +    - interrupts: Specifies a list of interrupt source and level-sense pairs.
>> > +      The type shall be <prop-encoded-array>.  The length shall be equal to
>> > +      the number of bits set in the 'msg-receive-mask' property value.
> Oh, just noticed -- mismatch between msg-receive-mask here...
> 
>> > +
>> > +Optional properties:
>> > +
>> > +    - mpic-msgr-receive-mask: Specifies what registers in the containing block
>> > +      are allowed to receive interrupts.  The value is a bit mask where a set
>> > +      bit at bit 'n' indicates that message register 'n' can receive interrupts.
>> > +      The type shall be <prop-encoded-array>.  If not present, then all of
>> > +      the message registers in the block are available.
> ...and mpic-msgr-receive-mask here.
> 
> Might want to just say "equal to the number of registers that are
> available for receiving interrupts", to more clearly apply to the case where
> mpic-msgr-receive-mask is missing.
> 

Thanks; fixed.

-- 
Meador Inge
CodeSourcery / Mentor Embedded
http://www.mentor.com/embedded-software
