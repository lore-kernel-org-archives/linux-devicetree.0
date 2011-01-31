From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] SDHCI: S3C: Add support for retrieving memory and irq
	resource information from device tree.
Date: Mon, 31 Jan 2011 11:00:26 -0700
Message-ID: <AANLkTim30eZH_yLRgi05wVyuuiQ0bhVKqZnHrDnb4gAc@mail.gmail.com>
References: <1296491294-11030-1-git-send-email-thomas.abraham@linaro.org>
	<4D46EABD.8010903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4D46EABD.8010903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Abraham <thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22LR7s880joybQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 10:00 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Thomas,
>
> On 01/31/2011 10:28 AM, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>
>> From: Thomas Abraham<thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>
>>
>> Add support for retrieving memory and irq resource information
>> from device tree for Samsung's SDHCI controller driver.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>
>> The modification will be made more generic to support both
>> DT and non-DT versions of the driver without the #ifdef's.
>> For now, this patch is for review and to understand if the
>> approach adopted to obtain resource information from the
>> device tree is appropriate.
>>

> You are missing an of_match_table. This patch could not work without it.

Actually, the way he is implementing it the of_match_table would have
absolutely no effect.  However, you are right, it *should* be
implemented so that it binds via the of_match_table.  I suspect Thomas
did it this way because he doesn't yet have an easy way to get his
platform devices registered from the device tree.

g.
