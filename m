From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/2] of: unittest: remove unneeded local return value
 variables
Date: Fri, 9 Mar 2018 17:28:12 -0800
Message-ID: <7f0ab50a-8a57-799d-e620-4e7f4fdf039d@gmail.com>
References: <1520548745-25021-1-git-send-email-frowand.list@gmail.com>
 <20180310000213.tonovc6n7jtknycj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180310000213.tonovc6n7jtknycj@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: devicetree@vger.kernel.org

On 03/09/18 16:02, Rob Herring wrote:
> On Thu, Mar 08, 2018 at 02:39:04PM -0800, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> A common pattern in many unittest functions is to save the return
>> value of a function in a local variable, then test the value of
>> the local variable, without using that return value for any further
>> purpose.  Remove the local return value variable for these cases.
>>
>> A second common pattern is:
>>
>>    ret = some_test_function(many, parameters, ...);
>>    if (unittest(ret == 0, "error message format", ...))
>>       return;
>>
>> This pattern is more clear when the local variable 'ret' is used, due
>> to the long lines caused by the parameters to the test function and
>> the long format and data parameters of unittest().  The local
>> variable is retained in these cases.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
>>  drivers/of/unittest.c | 89 ++++++++++++++-------------------------------------
>>  1 file changed, 24 insertions(+), 65 deletions(-)
> 
> Doesn't apply. What's it based on?
> 
> Rob
> 

Sorry, I guess I should have mentioned that.

Based on top of of_overlay_fdt_apply() v7 for 4.17.

It applies with or without Dan's "[PATCH] of: unittest: fix
an error test in of_unittest_overlay_8()", which made me notice
the common pattern.

-Frank
