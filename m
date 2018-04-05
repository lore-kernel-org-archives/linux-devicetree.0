From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND v2 3/4] doc/devicetree: Persistent memory region bindings
Date: Thu, 5 Apr 2018 07:43:20 -0700
Message-ID: <CAPcyv4jEFMnYqpcop=Ox-dZR3dSBRMhT05JSS-gPABX_YQGw1g@mail.gmail.com>
References: <20180403142415.30083-1-oohall@gmail.com>
 <20180403142415.30083-3-oohall@gmail.com>
 <CAPcyv4jW5H8A96MFD7-UazNSZq-t1_NfrChNB3p9=somdBpsNw@mail.gmail.com>
 <20180404220750.0436bbe1@gmail.com>
 <CAOSf1CGdKU4zQQauqo3UoNvKnKDMHteAEtsMWVtTG7T01csMbg@mail.gmail.com>
 <CAPcyv4if4un9mgFon4ttjKDYEtHC_GP6VoxUENp7YNS50T3afA@mail.gmail.com>
 <CAOSf1CHu4R-t8q-8fL6Dyk7myFR0gTfd6-0cxqtBVGZgYZWGAw@mail.gmail.com>
 <87bmexua3s.fsf@concordia.ellerman.id.au>
 <CAOSf1CEUnucUhW_pXG=7h5QBHvaH2-ENPKjGD42_0WEvbU6-Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAOSf1CEUnucUhW_pXG=7h5QBHvaH2-ENPKjGD42_0WEvbU6-Wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 5, 2018 at 5:43 AM, Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Apr 5, 2018 at 10:11 PM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
>> Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> ...
>>>
>>> For context Balbir is working with me on some of the pmem stuff. You
>>> probably want an Ack from Rob rather than one of us.
>>
>> I'll ack it if you make all the niggly nit picky trivial annoying
>> changes I asked for :D
>
> *groan*
>
> Fine, I'll respin it tomorrow. If anyone else has comments now would
> be the time to make them.

Please also include my niggly nit picky trivial annoying bike shed
color for the driver name to *not* use the "nd_region" suffix for a
driver registering "nvdimm_bus" objects. "of_pmem_range" or
"of_pmem_bus" or almost anything else would be fine.
