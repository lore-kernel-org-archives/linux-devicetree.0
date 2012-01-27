From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFCv2 00/14]
Date: Fri, 27 Jan 2012 15:13:02 -0700
Message-ID: <CACxGe6v2AuUrQu1xdfJkmXk05uHm2SgR3LD0_qTNRfvu-YxH1w@mail.gmail.com>
References: <1327352870-14687-1-git-send-email-grant.likely@secretlab.ca>
 <4F1DD6DF.4080706@gmail.com> <4F200DFD.7070407@ti.com>
 <4F204F1C.70908@gmail.com>
 <CACxGe6vA6CSCAU82uuMaycqDBt+JG3KvXzAURDWQ0Deyeg13Ow@mail.gmail.com>
 <1327702113.24487.19.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327702113.24487.19.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2012 at 3:08 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Thu, 2012-01-26 at 14:33 -0700, Grant Likely wrote:
>
>> I've got the x86 fix in my tree now. =A0It will be part of the next
>> merge. =A0MIPS, Microblaze and OpenRISC cannot turn on CONFIG_IRQ_DOMAIN
>> without rework. =A0I just hacked together the microblaze version, but
>> Michal will have to verify that it is correct. =A0I just posted it. =A0It
>> will be similar for the other two.
>>
>> The real problem is sparc which does something entirely different for
>> irqs. =A0Rather than resolving irqs on-demand, it calculates the Linux
>> irq numbers at boot time for every node in the tree. =A0The irq_domains
>> will need to be set up for all interrupt controllers before sparc
>> begins it's big walk of the tree to resolve interrupts. =A0I haven't dug
>> into everything that needs to be done to support this.
>>
>> I don't think you can count on turning on IRQ_DOMAIN on all
>> architectures just yet. =A0Adding irq_domain support directly to
>> irq_generic_chip is going to be difficult for that reason. =A0However,
>> it would be useful to have an irq_domain+irq_generic_chip wrapper that
>> can be enabled only when IRQ_DOMAIN is enabled.
>
> Beware also that there are plenty of cases where 1 irq domain !=3D 1 irq
> chip, for example on cell or xics where a single domain can encompass
> multiple chips. I don't know whether x86 APICs are the same, they could
> be tho :-)

Right, there will be some controllers using multiple irq_generic_chip
instances for a single irq_domain.  Anything with banks of irq
registers is a candidate here.

g.
