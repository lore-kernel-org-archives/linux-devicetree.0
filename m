From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: Dynamic overlay failure in 4.19 & 4.20
Date: Tue, 4 Jun 2019 20:39:04 +0100
Message-ID: <db0fdbc6-33ce-d7b6-c807-896905fe4a90@raspberrypi.org>
References: <c5af11eb-afe5-08c4-8597-3195c25ba1d5@raspberrypi.org>
 <4d5b9fba-3879-0729-119a-f7d585a74cc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4d5b9fba-3879-0729-119a-f7d585a74cc1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On 04/06/2019 19:20, Frank Rowand wrote:
> Hi Phil,
> 
> On 6/4/19 5:15 AM, Phil Elwell wrote:
>> Hi,
>>
>> In the downstream Raspberry Pi kernel we are using configfs to apply overlays at
>> runtime, using a patchset from Pantelis that hasn't been accepted upstream yet.
>> Apart from the occasional need to adapt to upstream changes, this has been working
>> well for us.
>>
>> A Raspberry Pi user recently noticed that this mechanism was failing for an overlay in
>> 4.19. Although the overlay appeared to be applied successfully, pinctrl was reporting
>> that one of the two fragments contained an invalid phandle, and an examination of the
>> live DT agreed - the target of the reference, which was in the other fragment, was
>> missing the phandle property.
>>
>> 5.0 added two patches - [1] to stop blindly copying properties from the overlay fragments
>> into the live tree, and [2] to explicitly copy across the name and phandle properties.
>> These two commits should be treated as a pair; the former requires the properties that
>> are legitimately defined by an overlay to be added via a changeset, but this mechanism
>> deliberately skips the name and phandle; the latter addresses this shortcoming. However,
>> [1] was back-ported to 4.19 and 4.20 but [2] wasn't, hence the problem.
> 
> I have relied upon Greg's statement that he would handle the stable kernels, and that
> the process of doing so would not impact (or would minimally impact) maintainers.  If
> I think something should go into stable, I will tag it as such, but otherwise I ignore
> the stable branches.  For overlay related code specifically, my base standard is that
> overlay support is an under development, not yet ready for prime time feature and thus
> I do not tag my overlay patches for stable.
> 
> Your research and analysis above sound like there are on target (thanks for providing
> the clear and detailed explanation!), so if you want the stable branches to work for
> overlays (out of tree, as you mentioned) I would suggest you email Greg, asking that
> the second patch be added to the stable branches.  Since the two patches you pointed
> out are put of a larger series, you might also want to check which of the other
> patches in that series were included in stable or left out from stable.  My suggestion
> that you request Greg add the second patch continues to rely on the concept that
> stable does not add to my workload, so I have not carefully analyzed whether adding
> the patch actually is the correct and full fix, but instead am relying on your good
> judgment that it is.

<useful context snipped>

Thank you - I'll email Greg directly as you suggest, with your answer as supporting
evidence.

Phil
