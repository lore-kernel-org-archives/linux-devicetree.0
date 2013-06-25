From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v5] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Tue, 25 Jun 2013 09:40:20 +0100
Message-ID: <51C95774.9060709@st.com>
References: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com>
 <51C8A6C8.8000009@codeaurora.org> <51C8B551.9080203@st.com>
 <51C8C172.8020207@codeaurora.org>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C8C172.8020207-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thankyou for the comments,
On 24/06/13 23:00, Stephen Boyd wrote:
> On 06/24/13 14:08, Srinivas KANDAGATLA wrote:
>> On 24/06/13 21:06, Stephen Boyd wrote:
>>> On 06/24/13 08:53, Srinivas KANDAGATLA wrote:
>
> 
> I think the problem is your clockevent has no rating. Please give it a
> rating (300?) so that it prevents the dummy from taking over. You don't
> need to worry about disabling the local timer API, it will register a
> harmless clockevent with a low rating (100) that should be ignored.
> 
I think I forgot to add rating in my last attempt to use cpu notifier.
With rating set to 300, the driver works fine with cpu notifiers.
Will send a new patch.

Thanks,
srini
