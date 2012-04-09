From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DT support in i2c
Date: Mon, 09 Apr 2012 08:34:46 -0500
Message-ID: <4F82E576.5090100@gmail.com>
References: <CAKON4OwBxfstLGFxqR+R9BD6bwD28OD-fCOwLSSs7v_Q=1LOyQ@mail.gmail.com>
 <4F8238A3.3010502@gmail.com>
 <CAKON4OwPYHP1Zhbc20CtgAvD_qNzAyXC5ndZbMhJh5aSd-W-VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OwPYHP1Zhbc20CtgAvD_qNzAyXC5ndZbMhJh5aSd-W-VA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/09/2012 12:26 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Sun, Apr 8, 2012 at 9:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 04/07/2012 06:26 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>> Grant, moving  of_i2c.c into drivers/i2c would parallel your spi/gpio patches.
>>>
>>> of_i2c_register_devices() needs to be moved up into i2c-core. Right
>>> now the ten bus drivers are individually calling it.
>>
>> I posted patches to do just this a while back and the i2c maintainers
>> didn't like the idea. Feel free to try again. :)
> 
> Try resubmitting the patch, but only submit this change. Looking back
> at the original submission Jean was concerned about other aspects of
> your series and it looks like he ignored this part.

Really? Seems pretty clear to me:

> But anyway, I don't buy the whole thing. We currently have a nice 
> separation between OF and the underlying bus types. Breaking it all 
> just for the sake of saving one call in 4 drivers (out of ~70 in the 
> current kernel tree) doesn't seem worth it, at all. It would make 
> things harder to maintain, too (I definitely do not want to maintain 
> OF-specific code). 

Maybe when i2c is the only thing left and there are dozens of OF enabled
i2c drivers he'll feel differently. In the meantime, I've got more
pressing things to spend time on.

Rob
