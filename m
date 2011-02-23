From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Wed, 23 Feb 2011 08:59:29 -0800
Message-ID: <4D653CF1.30009@caviumnetworks.com>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com>
	<1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com>
	<20110223000759.GA26300@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110223000759.GA26300@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/22/2011 04:07 PM, David Gibson wrote:
> On Tue, Feb 22, 2011 at 12:57:46PM -0800, David Daney wrote:
>> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>   arch/mips/cavium-octeon/.gitignore      |    2 +
>>   arch/mips/cavium-octeon/Makefile        |   13 ++
>>   arch/mips/cavium-octeon/octeon_3xxx.dts |  314 +++++++++++++++++++++++++++++++
>>   arch/mips/cavium-octeon/octeon_68xx.dts |   99 ++++++++++
>>   4 files changed, 428 insertions(+), 0 deletions(-)
>>   create mode 100644 arch/mips/cavium-octeon/.gitignore
>>   create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
>>   create mode 100644 arch/mips/cavium-octeon/octeon_68xx.dts
>>
[...]

>> +    };
>> +  };
>
> Uh.. where are the CPUs?
>

The number and type of CPUs can be (and is) probed.  There is an 
existing mechanism for the bootloader to communicate which CPUs should 
be used.

Likewise for memory, there is an existing mechanism for the bootloader 
to communicate which memory should be used.

It is possible that in the future, we would want to put CPUs and Memory 
in the Device Tree.  If we do, we can add that without having to disturb 
the 'soc' device bindings.

My main motivation for this first patch set is to get sane bindings for 
all the 'soc' devices  And to that end, your feedback has been quite useful.

Thanks,
David Daney
