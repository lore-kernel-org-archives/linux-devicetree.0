From: Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] libnvdimm: Add device-tree based driver
Date: Mon, 26 Mar 2018 12:07:29 +1100
Message-ID: <CAOSf1CFbdRhEbnCdrg5fGMLhMVz8Jpf=POs-opd6LqPe3nOEjQ@mail.gmail.com>
References: <20180323081209.31387-1-oohall@gmail.com>
 <20180323081209.31387-3-oohall@gmail.com>
 <CAPcyv4h=b9fCN7mCU8Yge5804oxVfErXRa_3h7QVcKdEhBbVHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAPcyv4h=b9fCN7mCU8Yge5804oxVfErXRa_3h7QVcKdEhBbVHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 24, 2018 at 4:07 AM, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Mar 23, 2018 at 1:12 AM, Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> This patch adds peliminary device-tree bindings for the NVDIMM driver.
>
> *preliminary
>
>> Currently this only supports one bus (created at probe time) which all
>> regions are added to with individual regions being created by a platform
>> device driver.
>>
>> Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> I suspect the platform driver should be holding a reference to the
>> created region. I left that out here since previously Dan has said
>> he'd rather keep the struct device internal to libnvdimm and the only
>> other way a region device can disappear is when the bus is unregistered.

> Hmm, but this still seems broken if bus teardown races region
> teardown.

Yeah looks like it.

>I think the more natural model, given the way libnvdimm is
> structured, to have each of these of_nd_region instances create their
> own nvdimm bus. Thoughts?

I'd prefer this too tbh. The main reason I'm looking at this approach
is that we plan on doing all interleave set configuration, etc from
Linux. So we'd like to have "similar" region/dimm devices end up in
the same bus to simplify validating managment ops, etc. That said, the
real enablement work for that is blocked on teams so I'm ok with
ignoring all of that for now.

Oliver
