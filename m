From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [RFC PATCH v4 1/6] of: Allow scripts/dtc/libfdt to be used from
 kernel code
Date: Mon, 23 May 2011 09:47:56 -0700
Message-ID: <4DDA8FBC.1090904@caviumnetworks.com>
References: <1305930343-31259-1-git-send-email-ddaney@caviumnetworks.com> <1305930343-31259-2-git-send-email-ddaney@caviumnetworks.com> <20110521063345.GB14828@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110521063345.GB14828@yookeroo.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/20/2011 11:33 PM, David Gibson wrote:
> On Fri, May 20, 2011 at 03:25:38PM -0700, David Daney wrote:
>> To use it you need to do this in your Kconfig:
>>
>> 	select LIBFDT
>>
>> And in the Makefile of the code using libfdt something like:
>>
>> ccflags-y := -include linux/libfdt_env.h -I$(src)/../../../scripts/dtc/libfdt
>>
>> Signed-off-by: David Daney<ddaney@caviumnetworks.com>
>> ---
>>   drivers/of/Kconfig          |    3 +++
>>   drivers/of/Makefile         |    2 ++
>>   drivers/of/libfdt/Makefile  |    3 +++
>>   drivers/of/libfdt/fdt.c     |    2 ++
>>   drivers/of/libfdt/fdt_ro.c  |    2 ++
>>   drivers/of/libfdt/fdt_wip.c |    2 ++
>
> No fdt_sw.c or fdt_rw.c?
>

I had no immediate need for them.  They could of course be added, but 
that would potentially waste space.

Let's see if I can make it into an archive library.

David Daney

>>   include/linux/libfdt.h      |    8 ++++++++
>>   include/linux/libfdt_env.h  |   13 +++++++++++++
>>   8 files changed, 35 insertions(+), 0 deletions(-)
>>   create mode 100644 drivers/of/libfdt/Makefile
>>   create mode 100644 drivers/of/libfdt/fdt.c
>>   create mode 100644 drivers/of/libfdt/fdt_ro.c
>
