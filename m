From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 6/8] [PATCH 6/8] Documentation: hwmon: Add a document
 for PECI hwmon client driver
Date: Tue, 6 Mar 2018 13:08:16 -0800
Message-ID: <27a5a530-6083-89fb-3258-bc29fb71d30f@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
 <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Randy,

On 3/6/2018 12:28 PM, Randy Dunlap wrote:
> Hi,
> 
> On 02/21/2018 08:16 AM, Jae Hyun Yoo wrote:
> 
>> +temp<n>_label		Provides DDR DIMM temperature if this label indicates
>> +			'DIMM #'.
>> +temp<n>_input		Provides current temperature of the DDR DIMM.
>> +
>> +Note:
>> +	DIMM temperature group will be appeared when the client CPU's BIOS
> 
> 	                       will appear when
> 

I'll fix this description as you suggested. Thanks a lot!

Jae

>> +	completes memory training and testing.
>>
> 
> 
