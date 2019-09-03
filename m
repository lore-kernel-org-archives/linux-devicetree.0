From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: syscon-reboot: Convert bindings
 to json-schema
Date: Tue, 3 Sep 2019 15:29:19 +0200
Message-ID: <CAJKOXPcGWuW7HP-_kj_OjpPyHtj9gr36bpVUeT5VF2V9wTZY9Q@mail.gmail.com>
References: <20190902150336.3600-1-krzk@kernel.org> <CAL_JsqK_O+7zQDGxAhAHDW=AkMy+RtyijTXUuRStOgu8CYXe0g@mail.gmail.com>
 <CAJKOXPfO0yBzGFPvF_WwsGGJBZSBGMLsFi2CQ2Eg5RVfyfW3nA@mail.gmail.com>
 <CAL_JsqJUfGBRAv=StPyavQU1DiHnFwUseNCvP6Ce_ZMohJXTXQ@mail.gmail.com>
 <CAJKOXPcjF9nERQxDdSVBLsfc2V_M1_BPZ6iM6EXvEx4tdr3rDQ@mail.gmail.com> <CAL_Jsq+1NEcmvrKPp9N=07CbxT3ZUsViXk7GGb1v0NzsxvWEdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+1NEcmvrKPp9N=07CbxT3ZUsViXk7GGb1v0NzsxvWEdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 3 Sep 2019 at 15:12, Rob Herring <robh+dt@kernel.org> wrote:
> > arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: syscon-reboot:
> > {'regmap': [[9]], 'mask': [[1]], '$nodename': ['syscon-reboot'],
> > 'value': [[1]], 'offset': [[1024]], 'compatible': ['syscon-reboot']}
> > is valid under each of {'required': ['mask']}, {'required': ['value',
> > 'mask']}, {'required': ['value']}
>
> Ahh, right. 'anyOf' is what we want:
>
> anyOf:
>   - required: [ value ]
>   - required: [ mask ]

This triggers meta-schema error:

  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
Traceback (most recent call last):
  File "/home/kozik/.local/lib/python3.5/site-packages/dtschema/lib.py",
line 429, in process_schema
    DTValidator.check_schema(schema)
  File "/home/kozik/.local/lib/python3.5/site-packages/dtschema/lib.py",
line 575, in check_schema
    raise jsonschema.SchemaError.create_from(error)
jsonschema.exceptions.SchemaError: Additional properties are not
allowed ('anyOf' was unexpected)

Failed validating 'additionalProperties' in metaschema['allOf'][0]:
    {'$id': 'http://devicetree.org/meta-schemas/base.yaml#',
     '$schema': 'http://json-schema.org/draft-07/schema#',
     'additionalProperties': False,
     'allOf': [{'$ref': 'http://json-schema.org/draft-07/schema#'}],
     'description': 'Metaschema for devicetree binding documentation',
     'properties': {'$id': {'pattern':
'http://devicetree.org/schemas/.*\\.yaml#'},
                    '$schema': {'enum':
['http://devicetree.org/meta-schemas/core.yaml#',

'http://devicetree.org/meta-schemas/base.yaml#']},
                    'additionalProperties': {'type': 'boolean'},
                    'allOf': {'items': {'propertyNames': {'enum': ['$ref',
                                                                   'if',
                                                                   'then',
                                                                   'else']}}},
                    'definitions': True,
                    'dependencies': True,
                    'description': True,
                    'else': True,
                    'examples': {'items': {'type': 'string'},
                                 'type': 'array'},
                    'if': True,
                    'maintainers': {'items': {'format': 'email',
                                              'type': 'string'},
                                    'type': 'array'},
                    'oneOf': True,
                    'patternProperties': True,
                    'properties': True,
                    'required': True,
                    'select': {'allOf': [{'$ref':
'http://json-schema.org/draft-07/schema#'},
                                         {'oneOf': [{'properties':
{'properties': True,

'required': True},
                                                     'type': 'object'},
                                                    {'type': 'boolean'}]}]},
                    'then': True,
                    'title': {'maxLength': 100},
                    'unevaluatedProperties': {'type': 'boolean'}},
     'required': ['$id', '$schema', 'title', 'maintainers']}

Best regards,
Krzysztof
