From: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] media: dt-bindings: aspeed-video: Add missing
 memory-region property
Date: Fri, 26 Apr 2019 09:11:31 -0500
Message-ID: <6fd356ba-815b-aa34-abd4-d3709daf453a@linux.ibm.com>
References: <1556119020-7609-1-git-send-email-eajames@linux.ibm.com>
 <1556119020-7609-4-git-send-email-eajames@linux.ibm.com>
 <20190424211732.GA18914@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424211732.GA18914@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, andrew@aj.id.au, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl
List-Id: devicetree@vger.kernel.org


On 4/24/19 4:17 PM, Rob Herring wrote:
> On Wed, 24 Apr 2019 10:16:59 -0500, Eddie James wrote:
>> Missed documenting this property in the initial commit.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>   - Add missing semi-colon
>>
>>   Documentation/devicetree/bindings/media/aspeed-video.txt | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.


Yes, I left it off because I added a semi-colon (trivial, I know, but it 
did change). The change log is there below the commit message.

Thanks,

Eddie


>
