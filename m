From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: net: ath10k: add new dt entry to identify external FEM
Date: Thu, 20 Dec 2018 15:23:31 +0200
Message-ID: <87lg4ktjqk.fsf@kamboji.qca.qualcomm.com>
References: <1544544804-4039-1-git-send-email-bperumal@codeaurora.org>
        <1544544804-4039-3-git-send-email-bperumal@codeaurora.org>
        <20181217203718.GA29320@bogus>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181217203718.GA29320@bogus> (Rob Herring's message of "Mon, 17
        Dec 2018 14:37:18 -0600")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Tue, Dec 11, 2018 at 09:43:23PM +0530, Bhagavathi Perumal S wrote:
>> This adds new dt entry ext-fem-name, it is used by ath10k driver
>> to select correct timing parameters and configure it in target wifi hardware.
>> The Front End Module(FEM) normally includes tx power amplifier(PA) and
>> rx low noise amplifier(LNA). The default timing parameters like tx end to
>> PA off timing values were fine tuned for internal FEM used in reference
>> design. And these timing values can not be same if ODM modifies hardware
>> design with different external FEM. This DT entry helps to choose correct
>> timing values in driver if different external FEM hardware used.
>> 
>> Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> Please add acks/reviewed-bys when posting new versions.

I added your reviewed-by from v3 in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=2f4f5a81c87b9be68aa087c238e2f2b9debbfa1b

-- 
Kalle Valo
