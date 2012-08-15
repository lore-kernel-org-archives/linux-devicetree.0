From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Date: Wed, 15 Aug 2012 02:12:55 +0000
Message-ID: <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
	<20120815011149.GF8136@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20120815011149.GF8136@truffula.fritz.box>
Content-Language: en-US
Content-ID: <6E2B3C1BBF8BBE41AF754E12242C5393@mgd.freescale.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: David Gibson <dwg@au1.ibm.com>
Cc: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2012 at 8:11 PM, David Gibson <dwg@au1.ibm.com> wrote:
> On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>
>> This patch add pre-processing capablity to dtc based on status property.
>> Now the dtc has additional option -P to enable Pre-processing based on
>> status property.
>>
>> The SOCS have lot of device tree infrastructure files which mark the
>> device nodes as disabled and the board level device tree enables them if
>> required. However while creating device tree blob, the compiler can
>> preprocess the nodes and exclude nodes marked as disabled, doing this
>> way will reduce the size of device tree blob.

IMHO, many devices that are marked as "disabled" in the DTS are
expecting to be enabled by the boot loader, so just because a node is
disabled in the DTS does not mean that it will be disabled when Linux
sees it.

>> In our case this has reduced the blob size from 29K to 15K.

I don't see that as significant.

>> Also nodes with status="disabled" is are never probed by dt platform bus
>> code.
>>
>> Again, Preprocessing is optional parameter to dtc.

Using this option would break a lot of our device trees.  Perhaps it
should be given a better name, like --strip-disabled.

-- 
Timur Tabi
Linux kernel developer at Freescale
