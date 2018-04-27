From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RFC PATCH 1/3] of: base: Introduce of_alias_check_id() to check
 alias IDs
Date: Fri, 27 Apr 2018 08:10:11 +0200
Message-ID: <ba081812-f532-5ebd-b052-cdeb1f02bff1@xilinx.com>
References: <cover.1524751696.git.michal.simek@xilinx.com>
 <6045807691c310ccdd57ab16524b7525f26a1dc1.1524751696.git.michal.simek@xilinx.com>
 <CAL_Jsq+69p1GstFua1-27LGv9MKT8dtbd1ytcq+GuvQ=VcEHKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+69p1GstFua1-27LGv9MKT8dtbd1ytcq+GuvQ=VcEHKg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 27.4.2018 04:39, Rob Herring wrote:
> On Thu, Apr 26, 2018 at 9:08 AM, Michal Simek <michal.simek@xilinx.com> wrote:
>> The function travers the lookup table to check if the request alias
>> id is compatible with the device driver match structure.
>> This function will be used by serial drivers to check if requested alias
>> is allocated or free to use.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>  drivers/of/base.c  | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/of.h |  2 ++
>>  2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 848f549164cd..382de01acc72 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1892,6 +1892,55 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>>  }
>>  EXPORT_SYMBOL_GPL(of_alias_get_id);
>>
>> +/**
>> + * of_alias_check_id - Check alias id for the give compatibility
>> + * @matches:   Array of of device match structures to search in
>> + * @stem:      Alias stem of the given device_node
>> + * @id:                Alias ID for checking
>> + *
>> + * The function travers the lookup table to check if the request alias id
>> + * is compatible with the device driver match structure
>> + *
>> + * Return true if ID is allocated, return false if not
>> + */
>> +bool of_alias_check_id(const struct of_device_id *matches, const char *stem,
>> +                      int id)
> 
> Wouldn't it be simpler to just return a bitmap of all allocated ids
> that match rather than trying to build that up 1 bit at a time?

Is alias list stable or can dt overlay change it?

What should be the expected flow? Find out maximum number of aliases of
the same kind and allocate bitmap and return it with length.

Anyway if you look at that patches I sent then I call in the driver
of_alias_get_highest_id("serial") which doesn't take care if alias match
with actual driver. It means having information about max alias ID which
match actual driver that would be helpful but I am not quite sure what
should be the flow.

Any link to similar function would be good to understand how the flow is
supposed to work.

Thanks,
Michal
