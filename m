From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] of: fix incorrect return value of
 of_find_matching_node_and_match()
Date: Sun, 20 Jan 2013 19:48:15 -0800
Message-ID: <CAJuYYwT_psGiQjpwM0qCvfTAhzLV+Yxjk5sVADO4BSnTSxG5sA@mail.gmail.com>
References: <1358619642-23607-1-git-send-email-thomas.abraham@linaro.org>
 <50FC66BA.9030503@gmail.com>
 <CAJuYYwT++66UUT5wdZh=B=VC7s2=T4w0qO6G7CEG6eCHT5WBCg@mail.gmail.com>
 <50FCB5B9.8000802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50FCB5B9.8000802@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: grant.likely@secretlab.ca, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On 20 January 2013 19:27, Rob Herring <robherring2@gmail.com> wrote:
> On 01/20/2013 03:56 PM, Thomas Abraham wrote:
>> On 20 January 2013 13:50, Rob Herring <robherring2@gmail.com> wrote:
>>> On 01/19/2013 12:20 PM, Thomas Abraham wrote:
>>>> The of_find_matching_node_and_match() function incorrectly sets the matched
>>>> entry to 'matches' when the compatible value of a node matches one of the
>>>> possible values. This results in incorrectly selecting the the first entry in
>>>> the 'matches' list as the matched entry. Fix this by noting down the result of
>>>> the call to of_match_node() and setting that as the matched entry.
>>>
>>> Looks fine, but is this breaking something in 3.8 or can it wait for 3.9?
>>
>> Yes, it can wait for 3.9. I am using this function while adding device
>> tree support for timers on exynos platform which will probably merged
>> in 3.9.
>
> Applied for 3.9. It's in my for-next branch on sources.calxeda.com. This
> is a stable branch.
>
> Rob

Thank you Rob.

Regards,
Thomas.
