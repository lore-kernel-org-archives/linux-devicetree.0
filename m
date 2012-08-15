From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for Pre-Processing.
Date: Wed, 15 Aug 2012 10:49:44 +0100
Message-ID: <502B70B8.1030709@st.com>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com> <20120815011149.GF8136@truffula.fritz.box> <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Tabi Timur-B04825 <B04825@freescale.com>
Cc: David Gibson <dwg@au1.ibm.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 15/08/12 03:12, Tabi Timur-B04825 wrote:
> On Tue, Aug 14, 2012 at 8:11 PM, David Gibson <dwg@au1.ibm.com> wrote:
>> On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>>
>>> This patch add pre-processing capablity to dtc based on status property.
>>> Now the dtc has additional option -P to enable Pre-processing based on
>>> status property.
>>>
>>> The SOCS have lot of device tree infrastructure files which mark the
>>> device nodes as disabled and the board level device tree enables them if
>>> required. However while creating device tree blob, the compiler can
>>> preprocess the nodes and exclude nodes marked as disabled, doing this
>>> way will reduce the size of device tree blob.
> IMHO, many devices that are marked as "disabled" in the DTS are
> expecting to be enabled by the boot loader, so just because a node is
> disabled in the DTS does not mean that it will be disabled when Linux
> sees it.
Good to know that,
But some of the secured bootloaders like the one's we use don't even
touch the dt blob.
>
>>> In our case this has reduced the blob size from 29K to 15K.
> I don't see that as significant.
>
>>> Also nodes with status="disabled" is are never probed by dt platform bus
>>> code.
>>>
>>> Again, Preprocessing is optional parameter to dtc.
> Using this option would break a lot of our device trees.
As this is optional parameter, I did not expect it to break the
default/existing behavior.
Correct me am missing anything?
>   Perhaps it
> should be given a better name, like --strip-disabled.
Thanks for the advice. I agree, Will be reposting the patch making this
option as --strip-disabled with CC to Jon Loeliger (dtc maintainer).

