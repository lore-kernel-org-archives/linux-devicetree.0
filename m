From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/3] Add R8A77980 GEther support
Date: Fri, 18 May 2018 14:00:57 +0300
Message-ID: <dfae27c2-0658-cdd5-a4f3-ff373e34fefd@cogentembedded.com>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <20180517.145357.2037804925428844092.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180517.145357.2037804925428844092.davem@davemloft.net>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/17/2018 09:53 PM, David Miller wrote:

>> Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
>> add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
>> register bits/values introduced with this chip, and ending with adding a new
>> 'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
>> value...
>>
>> [1/1] sh_eth: add RGMII support
>> [2/3] sh_eth: add EDMR.NBST support
>> [3/3] sh_eth: add R8A77980 support
> 
> Waiting for a respin of this, correcting the RGMII check in patch #1.

   Respun yesterday, will repost RSN. :-)

MBR, Sergei
