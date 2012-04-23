From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: fix signed vs unsigned conditional inside
 pinmux_map_to_setting
Date: Mon, 23 Apr 2012 17:59:46 +0200
Message-ID: <4F957C72.5030604@openwrt.org>
References: <1335168743-3868-1-git-send-email-blogic@openwrt.org>
 <4F957ADA.9000203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F957ADA.9000203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/04/12 17:52, Stephen Warren wrote:
> On 04/23/2012 02:12 AM, John Crispin wrote:
>> pinmux_map_to_settingi() uses setting->data.mux.func to store the return code of
>> pinmux_func_name_to_selector(). However, struct pinctrl_setting_mux defines the
>> func element as unsigned, resulting in all error codes getting lost. The
>> conditional following the assignment will always evaluate to false thus breaking
>> the error path.
> This makes sense.
>
> The exact same issue applies to the assignment to
> setting->data.mux.group just a little below. Can you fix that up too please?
>

missed the group thing, patch coming up ....
