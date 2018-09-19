From: Brian Dodge <bdodge09@gmail.com>
Subject: arc vendor prefix
Date: Tue, 18 Sep 2018 21:05:20 -0400
Message-ID: <527da392-9629-792b-08cc-970ffc8173ee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

In the linux kernel commit 91ab076e3a2f092254fe5231bbfa92b37fd52e38 the 
vendor prefix "arctic" was added to vendor-prefixes.txt.

The original change I authored used "arc" not "arctic", and the device 
tree bindings were added assuming that prefix in commit 
ce9d22573d85341c987f997461ac712e4dbe47b1

Perhaps odeju changed the name to arctic in the patch after I created it 
and before it was approved.

This pairing isn't really compatible is it?  Either the prefix should be 
reverted to "arc" or the bindings (and driver source) changed to use 
"arctic", as in "arctic,arc2c0608" vs. "arc,arc2c0608"

The arcticsand company is now part of psemi (formerly peregrine 
semiconductor) and they would like to keep using the arc prefix for 
these chips and in the driver and I plan on changing the 
vendor-prefix.txt to reflect that.

I am in the process of updating the driver code to support different and 
new variants of the chip and would like to know what the preference is 
for this prefix going forward.

Thank you

Brian
