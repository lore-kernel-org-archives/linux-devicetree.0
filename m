From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX
 + 1
Date: Tue, 16 Oct 2018 10:44:52 +0200
Message-ID: <dab86dfb-d56b-b7c3-8e2a-6955803a2842@embeddedor.com>
References: <cover.1539036280.git.gustavo@embeddedor.com>
 <3a1a95a4832af33dcd1842b0298d257bbcf1f5ab.1539036280.git.gustavo@embeddedor.com>
 <20181009072723.mshyvplpo2xmkyfl@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009072723.mshyvplpo2xmkyfl@qschulz>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 10/9/18 9:27 AM, Quentin Schulz wrote:
> Hi Gustavo,
> 
> On Tue, Oct 09, 2018 at 12:21:36AM +0200, Gustavo A. R. Silva wrote:
>> SERDES_MAX is a valid value to index ctrl->phys in
>> drivers/phy/mscc/phy-ocelot-serdes.c. But, currently,
>> there is an out-of-bounds bug in the mentioned driver
>> when reading from ctrl->phys, because the size of
>> array ctrl->phys is SERDES_MAX.
>>
>> Partially fix this by updating SERDES_MAX to be SERDES6G_MAX + 1.
>>
>> Notice that this is the first part of the solution to
>> the out-of-bounds bug mentioned above. Although this
>> change is not dependent on any other one.
>>
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
> 

Friendly ping. Who can you take this?

Thanks!
--
Gustavo
