From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] irq/of: Cleanup and Enchance irq_domain support.
Date: Fri, 30 Dec 2011 11:19:35 -0700
Message-ID: <CACxGe6t+GRc1afHLw9RGSprvN-X0dOCHHJAba=PZXcFPZjVpKg@mail.gmail.com>
References: <1323916330-8865-1-git-send-email-ddaney.cavm@gmail.com>
 <4EFDD925.3050806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EFDD925.3050806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 30, 2011 at 8:30 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> David,
>
> On 12/14/2011 08:32 PM, David Daney wrote:
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> Back in early Nov. I send the first version of this patch set. =A0Now
>> things are heating up again in the world of irq_domain, so I wanted to
>> try to get some closure on the issues I had. =A0The Octeon patch is
>> included here to show how I am using irq_domain, but is part of a much
>> larger effort to merge Octeon device tree support.
>>
>> The basic problem I am attempting to solve is using irq domains when
>> there is a 'non-linear' mapping of hwirq <--> irq within a domain.
>> Octeon has a single set of irq numbers that is used across two
>> different implementations of the interrupt controller as well as more
>> than 10 different SOCs all which use different subsets of the irq
>> number space. =A0The result is that the hwirq to irq mapping function
>> contains many gaps and discontinuities, it is really quite random.
>>
>> The existing irq domain infrastructure assumes a continuous linear
>> mapping of hwirq to irq that can be encapsulated by the irq_base,
>> hwirq_base and nr_irq elements of struct irq_domain. =A0This is not
>> suitable for the Octeon implementation.
>>
>> The gist of my change is to add an optional iterator function to
>> irq_domain_ops which knows how to iterate over the irq numbers in a
>> given domain. =A0For simple linear domains (those currently supported),
>> we iterate using the current method based on irq_base, hwirq_base and
>> nr_irq.
>>
>> Summary of the patches:
>>
>> 1) Get rid of some unused code to make subsequent changes simpler.
>>
>> 2) Cleanup the data type used by various hwirq functions and users.
>>
>> 3) Add the irq iterator, and fix up the ARM GIC code to use it instead
>> of the current irq_domain_for_each_irq().
>>
>> 4) Add the Octeon users of the interface.
>>
>> In an earlier exchange, Rob Herring had said:
>>
>> =A0 =A0... Handling sparse irqs is a potentially common problem, so we
>> =A0 =A0should address that in the core irqdomain code.
>>
>> Which is what this patch set is doing.
>>
>> There was a suggestion that perhaps having .to_irq() return a magic
>> value if there was no mapping would also work. =A0However I prefer this
>> approach as it separates the concepts of iteration and mapping of irq
>> numbers.
>>
>> Please comment.
>
> Can we first have a patch that just allows irq domains to be enabled on
> MIPS. It collides because of multiple versions of irq_create_of_mapping.

I'm working on this.  I made some poor decisions when first
implementing irq_domain which have made it difficult to bring into
sync with powerpc.  Right now I'm working on a series to replace the
new irq_domain with the existing (working-for-years) powerpc code and
converting over all the users.  Basically what I should have done in
the first place.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
