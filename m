From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH v2 3/9] ARM: shmobile: r8a7790: add dmac0 dmac1 nodes
Date: Wed, 04 Jun 2014 17:04:45 +0100
Message-ID: <538F439D.1000001@codethink.co.uk>
References: <1397511312-4845-1-git-send-email-ben.dooks@codethink.co.uk>	<1397511312-4845-4-git-send-email-ben.dooks@codethink.co.uk> <CAMuHMdUNAFJEFWYe5cpKaZqoZFhRA1s0YBntT5ZVJaieSj8ovQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUNAFJEFWYe5cpKaZqoZFhRA1s0YBntT5ZVJaieSj8ovQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, magnus.damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13/05/14 13:00, Geert Uytterhoeven wrote:
> Hi Ben,
> 
> On Mon, Apr 14, 2014 at 11:35 PM, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
>> --- a/arch/arm/boot/dts/r8a7790.dtsi
>> +++ b/arch/arm/boot/dts/r8a7790.dtsi
>> @@ -86,6 +88,76 @@
>>                 };
>>         };
>>
>> +       dma0: dma-mux@0 {
>> +               compatible = "renesas,shdma-mux";
>> +               #dma-cells = <2>;
>> +               dma-channels = <20>;
> 
> Shouldn't this be 30, i.e. the sum of the properties in the child nodes?

Thanks, fixed.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
