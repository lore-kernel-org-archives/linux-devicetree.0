From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] of: add NULL parameter check for of_device_is_available
Date: Tue, 13 Mar 2012 16:15:20 -0500
Message-ID: <4F5FB8E8.7010102@gmail.com>
References: <1331638805-17136-1-git-send-email-b29396@freescale.com> <20120313.133419.2242081944811028058.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120313.133419.2242081944811028058.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: b29396@freescale.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/13/2012 03:34 PM, David Miller wrote:
> From: Dong Aisheng <b29396@freescale.com>
> Date: Tue, 13 Mar 2012 19:40:05 +0800
> 
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> This function will return 1 even the device node passed in
>> is NULL which is a little error-prone.
>> Change to return 0 if the device node passed in is NULL.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> 
> I think this is a hard error and therefore BUG_ON(!device) is
> more appropriate.

Shouldn't removing a node from the dts and adding 'status = "disabled";'
to a node give the same behavior? Then you can do something like this:

if (of_device_is_available(of_find_compatible_node("blah")))
	//foo

Rob
