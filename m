From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 09/15] MIPS: platform: add machtype IDs for more
 Ingenic SoCs
Date: Tue, 2 Jan 2018 21:29:23 +0530
Message-ID: <CANc+2y6YXXtFsjCbxP-WVOSXaN9nmtn5VkQ_ZVdVzpvK_eXbKw@mail.gmail.com>
References: <20180102150848.11314-1-paul@crapouillou.net> <20180102150848.11314-9-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102150848.11314-9-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2 January 2018 at 20:38, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> Add a machtype ID for the JZ4780 SoC, which was missing, and one for the
> newly supported JZ4770 SoC.
>
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  arch/mips/include/asm/bootinfo.h | 2 ++
>  1 file changed, 2 insertions(+)
>
>  v2: No change
>  v3: No change
>  v5: No change
>
> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
> index e26a093bb17a..a301a8f4bc66 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -79,6 +79,8 @@ enum loongson_machine_type {
>   */
>  #define  MACH_INGENIC_JZ4730   0       /* JZ4730 SOC           */
>  #define  MACH_INGENIC_JZ4740   1       /* JZ4740 SOC           */
> +#define  MACH_INGENIC_JZ4770   2       /* JZ4770 SOC           */
> +#define  MACH_INGENIC_JZ4780   3       /* JZ4780 SOC           */
>
>  extern char *system_type;
>  const char *get_system_type(void);
> --
> 2.11.0
>
>

Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
