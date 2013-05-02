From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Thu, 02 May 2013 12:49:59 -0600
Message-ID: <5182B557.4040804@wwwdotorg.org>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com>
 <516EEAA0.10906@wwwdotorg.org> <20130418090310.GA17636@ab42.lan>
 <CACRpkdZd0_W432od5565phhUcJMRWiV9vXX4QVF4osKkxstC0Q@mail.gmail.com>
 <20130429161725.GB30136@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130429161725.GB30136-7oYq3qWSd+k@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Leuenberger <sascha.leuenberger-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/29/2013 10:17 AM, Christian Ruppert wrote:
> Hello Linus,
> 
> On Fri, Apr 26, 2013 at 09:47:16AM +0200, Linus Walleij wrote:
>> On Thu, Apr 18, 2013 at 11:03 AM, Christian Ruppert
>> <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> We would like to avoid the use of Linux pin numbers in the device tree.
>>> Customers are used to physical pin numbers and exposing the logical
>>> Linux-internal numbering scheme through the device tree would generate
>>> quite some confusion. There are two reasons why we cannot align the two:
>>>   - Not all products supported by these drivers have the same pin outs.
>>>   - GPIO ranges must be consecutive in the Linux pin numbering space
>>>     which is generally not the case in physical pin numbering.
>>
>> If you are talking about the pin numbers really, i.e. the number we
>> put into
>>
>> struct pinctrl_pin_desc {
>>         unsigned number; <- this
>>         const char *name;
>> };
>>
>> Then are you aware that this is a sparse number space?
>>
>> I.e. you can choose whatever number you want. You do not have
>> to offset numbers from zero or anything like that. You just
>> need to make sure the numbers do not overlap (no two pins
>> have the same number).
>>
>> So if this is what you want to achieve, just use the same number
>> as in your datasheet in the pin number -> problem solved.
> 
> The problem is that we must support several products which are basically
> different packaging options of the same chip (or simplified versions
> thereof). Not all of those products will have the same number of pins
> and as a consequence, data sheet pin numbering will also be different.
> The port names are going to remain the same for all products, however.
> Some of the ports are just not going to be physically available in some
> or the products. Sorry if that wasn't clear from my previous mail.

It sounds like you can use the exact same numbering scheme for all the
different packaging options; it's just that some of the pin numbers
simply won't exist on some of the packaging options, so while defined by
the DT binding, it simply won't make sense to use them?

Certainly, Tegra20 has two packaging options, and the pinctrl driver for
it has zero knowledge of this. Perhaps we're just lucky though. I guess
the Tegra TRM doesn't define any "Pin number" (just "pin name") for the
pins, so there's no possibility of the same "number" meaning different
things in the two packages, so perhaps we're just getting lucky here.
