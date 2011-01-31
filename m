From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/3 RFC] dt: add documentation of ARM dt boot interface
Date: Mon, 31 Jan 2011 11:03:21 -0700
Message-ID: <AANLkTinU7GOpDt83BHYfbzkbifW1yH3OMFS-2+6XCCe4@mail.gmail.com>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
 <20110131074510.9058.59071.stgit@localhost6.localdomain6> <44dc88e7-3086-4762-8789-f455f3b265ec@VA3EHSMHS027.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44dc88e7-3086-4762-8789-f455f3b265ec@VA3EHSMHS027.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 11:00 AM, Stephen Neuendorffer
<stephen.neuendorffer@xilinx.com> wrote:
>
>
>> -----Original Message-----
>> From: linuxppc-dev-bounces+stephen=3Dneuendorffer.name@lists.ozlabs.=
org
> [mailto:linuxppc-dev-
>> bounces+stephen=3Dneuendorffer.name@lists.ozlabs.org] On Behalf Of G=
rant
> Likely
>> Sent: Sunday, January 30, 2011 11:46 PM
>> To: devicetree-discuss@lists.ozlabs.org;
> linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Cc: sam@ravnborg.org
>> Subject: [PATCH 3/3 RFC] dt: add documentation of ARM dt boot
> interface
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>>
>> For RFC only. =A0I do not plan to merge this change yet.
>>
>> g.
>>
>> =A0Documentation/devicetree/booting-without-of.txt | =A0 40
> +++++++++++++++++++++++
>> =A01 files changed, 40 insertions(+), 0 deletions(-)
>>
>> diff --git a/Documentation/devicetree/booting-without-of.txt
> b/Documentation/devicetree/booting-
>> without-of.txt
>> index 6bca668..3950aea 100644
>> --- a/Documentation/devicetree/booting-without-of.txt
>> +++ b/Documentation/devicetree/booting-without-of.txt
>
> In order to make this more generic, perhaps it should change names, s=
o
> that it is actually a description of what the file
> describes, as opposed to what it doesn't describe. =A0"booting.txt"?

I though about that, but I think I'd like to leave it as-is for the
time being so that it is easier for people to find where it has moved
to.

>
>> @@ -13,6 +13,7 @@ Table of Contents
>>
>> =A0 =A0I - Introduction
>> =A0 =A0 =A01) Entry point for arch/powerpc
>> + =A0 =A02) Entry point for arch/arm
>
> We should probably include microblaze here too...

Awesome, thanks for volunteering to write the patch!  :-)

g.
