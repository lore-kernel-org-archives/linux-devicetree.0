From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] Documentation: dt: Add bindings for Secure-only devices
Date: Tue, 03 Nov 2015 23:04:48 -0800
Message-ID: <5639AE10.5090500@gmail.com>
References: <1446127303-5082-1-git-send-email-peter.maydell@linaro.org>
 <CAL_JsqJz+w2SYEBLVGdZNS6J1tmt5VWV0q1G_Z2rgFfch6J=2A@mail.gmail.com>
 <CAFEAcA8qgFFhrmXePtO_xQx=YEHK8dSA-1SacR5NsQWSNTwj-w@mail.gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFEAcA8qgFFhrmXePtO_xQx=YEHK8dSA-1SacR5NsQWSNTwj-w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Christoffer Dall <christoffer.dall@linaro.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10/30/2015 1:07 PM, Peter Maydell wrote:
> On 30 October 2015 at 18:28, Rob Herring <robh+dt@kernel.org> wrote:
>> On Thu, Oct 29, 2015 at 9:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> +Valid Secure world properties:
>>> +
>>> +- secure-status : specifies whether the device is present and usable
>>> +  in the secure world. The combination of this with "status" allows
>>> +  the various possible combinations of device visibility to be
>>> +  specified:
>>> +   status = "okay";                             // visible in S and NS
>>
>> I assume neither property present or both okay also mean the same.
>>
>> status = "okay"; secure-status = "okay";
>>
>> We should be explicit.
> 
> Yes; status defaults to "okay" (presumably this is listed in
> the overal DT binding spec somewhere), 

Valid values for the "status" property do not seem to be well documented
for Linux.

The code, __of_device_is_available(), implements:

  value of "okay"  returns true
  value of "ok"    returns true
  status property does not exist returns true (thus defaults to true)

  anything else returns false.

Eight individual bindings define the status property (I'll put them
on my todo list to remove since they should be inherited).  The status
property should be in a top level binding, which should be created as
part of the bindings documentation cleanup.  I'll watch for it to get
created or do it myself.

(Lots of bindings show examples of using the status property in their
examples -- that is fine.)

ePAPR v1.1, section "2.3.4 status" does not list "ok", but does list:
  "okay"
  "disabled"
  "fail"
  "fail-sss"


< snip >

-Frank
