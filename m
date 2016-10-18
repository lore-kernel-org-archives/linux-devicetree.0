From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 01/19] phy: phy-miphy365x: Remove miphy365 driver and dt
 binding documentation.
Date: Tue, 18 Oct 2016 09:47:10 +0200
Message-ID: <12506413-515f-1a33-a642-ede60287ca3b@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-2-git-send-email-peter.griffin@linaro.org>
 <20160923150636.GA9176@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923150636.GA9176@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/23/2016 05:06 PM, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 02:27:39PM +0100, Peter Griffin wrote:
>> This phy is only used on STiH415/6 based silicon, and support for
>> these SoC's is being removed from the kernel.
>>
>> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: <kishon-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/phy/phy-miphy365x.txt      |  77 ---
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied on sti-dt-for-4.10 branch

Thanks 

> 
>>  drivers/phy/Kconfig                                |  10 -
>>  drivers/phy/Makefile                               |   1 -
>>  drivers/phy/phy-miphy365x.c                        | 625 ---------------------
>>  4 files changed, 713 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-miphy365x.txt
>>  delete mode 100644 drivers/phy/phy-miphy365x.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
