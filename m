From: Grant Likely <grant.likely@arm.com>
Subject: Re: DT case sensitivity
Date: Thu, 23 Aug 2018 12:56:10 +0100
Message-ID: <ffede83b-cdfe-7f96-3678-f63522c4ef40@arm.com>
References: <CAL_Jsq+XacT2O15CQ=F_6dmWf6OqNf8_fKAOrMJNR79a6mORaw@mail.gmail.com>
 <3335cff2cc999c1dda58d75949ab3d12185fca79.camel@kernel.crashing.org>
 <CAL_JsqKqkO31ekVMFKs+osLvKdZyDzRowF1thWXn5=tWhrJgvw@mail.gmail.com>
 <18175413a0148f7859ab36ed9715dce7a598f318.camel@kernel.crashing.org>
 <13bf5b39-0461-351e-57e3-60264eaa374d@arm.com>
 <CAL_Jsq+1T8k5mtc-DgDBtX3Qco9sQG9RWv6FTZ8NXppNbNg3Ww@mail.gmail.com>
 <e9009f6dd3aded2b9aa735973f4eed8386dd9afb.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <e9009f6dd3aded2b9aa735973f4eed8386dd9afb.camel@kernel.crashing.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kumar Gala <kumar.gala@linaro.org>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Frank Rowand <frowand.list@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On 23/08/2018 12:47, Benjamin Herrenschmidt wrote:
> On Thu, 2018-08-23 at 06:43 -0500, Rob Herring wrote:
>> On Thu, Aug 23, 2018 at 4:02 AM Grant Likely <grant.likely@arm.com> wrot=
e:
>>>
>>>
>>> What problem are you trying to solve?
>>
>> I'm looking at removing device_node.name and using full_name instead
>> (which now is only the local node name plus unit-address). This means
>> replacing of_node_cmp() (and still some strcmp) calls in a lot of
>> places. I need to use either strncmp or strncasecmp instead.
Makes sense. Simplifies the code.

>>
>>> I would think making everything
>>> case insensitive would be the direction to go if you do anything. Least
>>> possibility of breaking existing platforms in that scenario.
>>
>> Really? Even if all the "new" arches are effectively case sensitive?
>> Anything using dtc and libfdt are (and json-schema certainly will be).
>> But I frequently say the kernel's job is not DT validation, so you
>> pass crap in, you get undefined results.
>
> I tend to agree with Grant. Let's put it this way:
>
> What is the drawback of being case insensitive ?
>
> Do we expect that there exist a case where we will want to distinguish
> between nodes that have the same name with a different case ? >
> If not, I don't see the point of being strict about it.

I'd also add that any place where there are two nodes or props with the
same name, but different case, then it is probably a bug (or a really
bad design). Going the direction of case-insensitive eliminates the
possibility.

I do understand that that you'd like the kernel to be strict about what
it accepts, but that strictness probably makes more sense back in DTC
where it can also be checked against schema.

g.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
