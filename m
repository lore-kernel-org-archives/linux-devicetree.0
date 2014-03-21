From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [RFC PATCH v2 0/2] clk: Support for DT assigned clock parents
 and rates
Date: Fri, 21 Mar 2014 15:09:26 +0100
Message-ID: <532C4816.2080102@st.com>
References: <1393870533-20845-1-git-send-email-s.nawrocki@samsung.com>
 <53187C13.3040202@st.com> <532AE239.9000800@samsung.com>
 <20140321014551.21989.57253@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140321014551.21989.57253@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, t.figa@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Mike,

On 03/21/2014 02:45 AM, Mike Turquette wrote:
> Quoting Sylwester Nawrocki (2014-03-20 05:42:33)
>> Hi Maxime,
>>
>> On 06/03/14 14:45, Maxime Coquelin wrote:
>>> Hi Sylwester,
>>>
>>>        I like the principle of your implementation, but I have two questions:
>>>        1 - How can we manage PM with this solution, as the parent/rate will be
>>> set only once at probe time?
>>>        2 - How to set the parent of a parent clock (which can be shared with
>>> other devices)? Same question about the parent rates.
>>
>> Thanks for your feedback and apologies for late reply.
>>
>> IIUC your first concern is about a situation when clocks need to be
>> reconfigured upon each resume from system sleep or runtime PM resume ?
>> As I mentioned in v1 of the RFC I was considering having individual
>> drivers calling explicitly the clocks set up routine. Presumably this
>> would allow to resolve the power management related issue.
>> One example I'm aware the approach as in this RFC wouldn't work is
>> when a device in a SoC belongs to a power domain, which needs to be
>> first switched on before we can start setting up and the clocks'
>> configuration get lost after the power domain switch off.
>
> I like Sylwester's approach of handling this one-time setup in the
> driver core.
>
> Any kind of fine grained power management should not be hidden by DT,
> and by definition that logic belongs in the device driver. It can still
> be nicely abstracted away by runtime pm[1].
>
> Regards,
> Mike
>
> [1] Message-ID: <20140320114238.GQ7528@n2100.arm.linux.org.uk>
How can I access this reference?

Thanks,
Maxime

>
>>
>> OTOH I suspect devices for which one-time clocks setup is sufficient
>> will be quite common. And for these there would need to be a single
>> call to the setup routine in probe() I guess, since it wouldn't be
>> possible to figure out just from the DT data when the actual call
>> should be made.
>>
>> For a global clocks configuration, I thought about specifying that
>> in the clocks controller node, and then to have the setup routine
>> called e.g. from of_clk_init(). I think that could work well enough,
>> together with the patch [1], adding clock dependencies handling.
>> But then the clock frequency set up function would need to be
>> modified to respect the clock parent relationships, similarly as
>> in patch series [2]. A just noticed [2] recently, after posting
>> this RFC (adding Tero at Cc).
>>
>> --
>> Regards,
>> Sylwester
>>
>> [1] http://www.spinics.net/lists/arm-kernel/msg310507.html
>> [2] http://www.spinics.net/lists/linux-omap/msg103069.html
