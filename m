From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: VIC: Create common infrastructure for vic DT
 bindings
Date: Sun, 25 Mar 2012 20:59:22 -0500
Message-ID: <4F6FCD7A.3030804@gmail.com>
References: <4bfe7af3761f6f40506a2089fd67866015f6d7f3.1332488625.git.viresh.kumar@st.com>
 <4F6C6F32.10800@gmail.com>
 <CAOh2x=n-sZ6jV1M9XY9cOp7_8EeRfvqkjL5y3AakgpYymFRHkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOh2x=n-sZ6jV1M9XY9cOp7_8EeRfvqkjL5y3AakgpYymFRHkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/25/2012 02:31 AM, viresh kumar wrote:
> On Fri, Mar 23, 2012 at 6:10 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> NAK
>>
>> None of these platforms have gpio interrupts or any other board
>> interrupt controllers which need to be initialized early?
> 
> Atleast SPEAr600 have GPIO interrupts.
> 
>> I don't think DT conversions are complete enough to tell.
> 
> Couldn't get your comment, sorry.

Some DT enabled platforms may only have the gic or vic included in their
match list currently because other interrupt controllers aren't yet
converted to DT. I believe Exynos is one such example.

> 
>> We could do something like this, but there only needs to be a single
>> match list of all controllers and function. We should consolidate the
>> irqchips to drivers/irqchip first though. I have that action from Connect...
> 
> That would be good.
> I am updating DT support for SPEAr3xx, where i need to use VIC OF
> support. So i would still like to get this patch going and you can consilidate
> code at irqchips level later. What do you say?

No. I don't think moving this into the gic and vic code just to move it
back out later is a good idea. Just looking at the diffstat, the net
number of lines removed is not very compelling either.

Rob

> 
> --
> viresh
