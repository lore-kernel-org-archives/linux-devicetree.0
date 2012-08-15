From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for Pre-Processing.
Date: Wed, 15 Aug 2012 06:00:23 -1000
Message-ID: <502BC797.4040300@firmworks.com>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com> <20120815011149.GF8136@truffula.fritz.box> <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com> <502B70B8.1030709@st.com> <20120815112911.GC4171@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20120815112911.GC4171@truffula.fritz.box>
Sender: linux-kbuild-owner@vger.kernel.org
To: David Gibson <dwg@au1.ibm.com>
Cc: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Tabi Timur-B04825 <B04825@freescale.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/15/2012 1:29 AM, David Gibson wrote:
> On Wed, Aug 15, 2012 at 10:49:44AM +0100, Srinivas KANDAGATLA wrote:
>> On 15/08/12 03:12, Tabi Timur-B04825 wrote:
>>> On Tue, Aug 14, 2012 at 8:11 PM, David Gibson <dwg@au1.ibm.com> wrote:
>>>> On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>>>>
>>>>> This patch add pre-processing capablity to dtc based on status property.
>>>>> Now the dtc has additional option -P to enable Pre-processing based on
>>>>> status property.
>>>>>
>>>>> The SOCS have lot of device tree infrastructure files which mark the
>>>>> device nodes as disabled and the board level device tree enables them if
>>>>> required. However while creating device tree blob, the compiler can
>>>>> preprocess the nodes and exclude nodes marked as disabled, doing this
>>>>> way will reduce the size of device tree blob.
>>> IMHO, many devices that are marked as "disabled" in the DTS are
>>> expecting to be enabled by the boot loader, so just because a node is
>>> disabled in the DTS does not mean that it will be disabled when Linux
>>> sees it.
>> Good to know that,
>> But some of the secured bootloaders like the one's we use don't even
>> touch the dt blob.
> 
> It's not just a question of bootloaders.  Status "disabled" devices
> can potentially be activated in some way by the OS.  For example ePAPR
> specifies that all secondary CPUs be marked "disabled" with other
> properties indicating the method by which the OS can turn them on.
> 

You could use a different value for status, for example "not present",
to indicate that the device can never be used, and this is fair game for
removal from the tree.

>>>>> In our case this has reduced the blob size from 29K to 15K.
>>> I don't see that as significant.
>>>
>>>>> Also nodes with status="disabled" is are never probed by dt platform bus
>>>>> code.
>>>>>
>>>>> Again, Preprocessing is optional parameter to dtc.
>>> Using this option would break a lot of our device trees.
>> As this is optional parameter, I did not expect it to break the
>> default/existing behavior.
>> Correct me am missing anything?
>>>   Perhaps it
>>> should be given a better name, like --strip-disabled.
>> Thanks for the advice. I agree, Will be reposting the patch making this
>> option as --strip-disabled with CC to Jon Loeliger (dtc maintainer).
> 
> --strip-disabled is a reasonable name, however at present dtc doesn't
> support long option names, so there will be some more work enabling
> that.
> 
