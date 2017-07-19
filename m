From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3 1/3] of: overlay: add overlay unittest data for node
 names and symbols
Date: Wed, 19 Jul 2017 09:16:14 -0700
Message-ID: <596F85CE.7000301@gmail.com>
References: <1500436340-7748-1-git-send-email-frowand.list@gmail.com>
 <1500436340-7748-2-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+2VDvgK-N93rOYAJ=TSGDJeJfP_ba0jM2=suLZ6OBrtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+2VDvgK-N93rOYAJ=TSGDJeJfP_ba0jM2=suLZ6OBrtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/19/17 06:39, Rob Herring wrote:
> On Tue, Jul 18, 2017 at 10:52 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Add nodes and properties to overlay_base and overlay dts files to
>> test for
>>    - incorrect existing node name detection when overlay node name
>>      has a unit-address
>>    - adding overlay __symbols__ properties to live tree when an
>>      overlay is added to the live tree
>>
>> The following console messages will appear near the end of unittest
>> until the code errors are corrected:
>>
>>    OF: Duplicate name in fairway-1, renamed to "ride@100#1"
>>
>>    ### dt-test ### FAIL of_unittest_overlay_high_level():2296 Adding overlay 'overlay_bad_symbol' failed
>>
>>    ### dt-test ### end of unittest - 190 passed, 1 failed
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
>> diff --git a/drivers/of/unittest-data/overlay.dts b/drivers/of/unittest-data/overlay.dts
>> index 6cd7e6a0c13e..81140adbe770 100644
>> --- a/drivers/of/unittest-data/overlay.dts
>> +++ b/drivers/of/unittest-data/overlay.dts
>> @@ -25,7 +25,18 @@
>>                         #size-cells = <1>;
>>                         status = "ok";
>>
>> -                       ride@200 {
>> +                       ride@100 {
>> +
>> +                               track@3 {
> 
> These need a reg property.

OK.

I changed track@3 to track@30, and track@4 to track@40.
Then I added the reg property to .../ride@100/track@30/ and
.../ride@100/track@40/ in the base dts since those nodes
exist in the base dts.  As a result, W=2 will still warn
about a missing reg property for these two nodes in
the overlay.

> 
>> +                                       incline_up = < 48 32 16 >;
> 
> Don't use '_'.

OK.

> 
> Build with W=2 to check dtc warnings.

OK.

> 
> Rob
> 
